Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D32904
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 07:16:34 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MTQHs2JYnz14QVj;
	Fri, 16 Sep 2022 15:12:25 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 15:16:24 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <andrii@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<haoluo@google.com>, <jolsa@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
	<kuba@kernel.org>, <hawk@kernel.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [bpf-next v2 1/2] libbpf: Add pathname_concat() helper
Date: Fri, 16 Sep 2022 15:36:59 +0800
Message-ID: <1663313820-29918-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected

Move snprintf and len check to common helper pathname_concat() to make the
code simpler.

Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 tools/lib/bpf/libbpf.c | 76 +++++++++++++++++++-------------------------------
 1 file changed, 29 insertions(+), 47 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 3ad1392..7ab977c 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2096,19 +2096,30 @@ static bool get_map_field_int(const char *map_name, const struct btf *btf,
 	return true;
 }
 
+static int pathname_concat(const char *path, const char *name, char *buf)
+{
+	int len;
+
+	len = snprintf(buf, PATH_MAX, "%s/%s", path, name);
+	if (len < 0)
+		return -EINVAL;
+	if (len >= PATH_MAX)
+		return -ENAMETOOLONG;
+
+	return 0;
+}
+
 static int build_map_pin_path(struct bpf_map *map, const char *path)
 {
 	char buf[PATH_MAX];
-	int len;
+	int err;
 
 	if (!path)
 		path = "/sys/fs/bpf";
 
-	len = snprintf(buf, PATH_MAX, "%s/%s", path, bpf_map__name(map));
-	if (len < 0)
-		return -EINVAL;
-	else if (len >= PATH_MAX)
-		return -ENAMETOOLONG;
+	err = pathname_concat(path, bpf_map__name(map), buf);
+	if (err)
+		return err;
 
 	return bpf_map__set_pin_path(map, buf);
 }
@@ -7961,17 +7972,9 @@ int bpf_object__pin_maps(struct bpf_object *obj, const char *path)
 			continue;
 
 		if (path) {
-			int len;
-
-			len = snprintf(buf, PATH_MAX, "%s/%s", path,
-				       bpf_map__name(map));
-			if (len < 0) {
-				err = -EINVAL;
-				goto err_unpin_maps;
-			} else if (len >= PATH_MAX) {
-				err = -ENAMETOOLONG;
+			err = pathname_concat(path, bpf_map__name(map), buf);
+			if (err)
 				goto err_unpin_maps;
-			}
 			sanitize_pin_path(buf);
 			pin_path = buf;
 		} else if (!map->pin_path) {
@@ -8009,14 +8012,9 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
 		char buf[PATH_MAX];
 
 		if (path) {
-			int len;
-
-			len = snprintf(buf, PATH_MAX, "%s/%s", path,
-				       bpf_map__name(map));
-			if (len < 0)
-				return libbpf_err(-EINVAL);
-			else if (len >= PATH_MAX)
-				return libbpf_err(-ENAMETOOLONG);
+			err = pathname_concat(path, bpf_map__name(map), buf);
+			if (err)
+				return err;
 			sanitize_pin_path(buf);
 			pin_path = buf;
 		} else if (!map->pin_path) {
@@ -8034,6 +8032,7 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
 int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 {
 	struct bpf_program *prog;
+	char buf[PATH_MAX];
 	int err;
 
 	if (!obj)
@@ -8045,17 +8044,9 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 	}
 
 	bpf_object__for_each_program(prog, obj) {
-		char buf[PATH_MAX];
-		int len;
-
-		len = snprintf(buf, PATH_MAX, "%s/%s", path, prog->name);
-		if (len < 0) {
-			err = -EINVAL;
-			goto err_unpin_programs;
-		} else if (len >= PATH_MAX) {
-			err = -ENAMETOOLONG;
+		err = pathname_concat(path, prog->name, buf);
+		if (err)
 			goto err_unpin_programs;
-		}
 
 		err = bpf_program__pin(prog, buf);
 		if (err)
@@ -8066,13 +8057,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 
 err_unpin_programs:
 	while ((prog = bpf_object__prev_program(obj, prog))) {
-		char buf[PATH_MAX];
-		int len;
-
-		len = snprintf(buf, PATH_MAX, "%s/%s", path, prog->name);
-		if (len < 0)
-			continue;
-		else if (len >= PATH_MAX)
+		if (pathname_concat(path, prog->name, buf))
 			continue;
 
 		bpf_program__unpin(prog, buf);
@@ -8091,13 +8076,10 @@ int bpf_object__unpin_programs(struct bpf_object *obj, const char *path)
 
 	bpf_object__for_each_program(prog, obj) {
 		char buf[PATH_MAX];
-		int len;
 
-		len = snprintf(buf, PATH_MAX, "%s/%s", path, prog->name);
-		if (len < 0)
-			return libbpf_err(-EINVAL);
-		else if (len >= PATH_MAX)
-			return libbpf_err(-ENAMETOOLONG);
+		err = pathname_concat(path, prog->name, buf);
+		if (err)
+			return libbpf_err(err);
 
 		err = bpf_program__unpin(prog, buf);
 		if (err)
-- 
1.8.3.1

