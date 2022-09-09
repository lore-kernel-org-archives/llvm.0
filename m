Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44D622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 05:34:32 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP4P10dQmznVCR;
	Fri,  9 Sep 2022 13:31:49 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 13:34:24 +0800
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
Subject: [bpf-next 2/2] libbpf: Add pathname_concat() helper
Date: Fri, 9 Sep 2022 13:45:46 +0800
Message-ID: <1662702346-29665-2-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662702346-29665-1-git-send-email-wangyufen@huawei.com>
References: <1662702346-29665-1-git-send-email-wangyufen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected

Move snprintf and len check to common helper pathname_concat() to make the
code simpler.

Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 tools/lib/bpf/libbpf.c | 74 ++++++++++++++++++--------------------------------
 1 file changed, 27 insertions(+), 47 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 5854b92..238a03e 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2096,20 +2096,31 @@ static bool get_map_field_int(const char *map_name, const struct btf *btf,
 	return true;
 }
 
-static int build_map_pin_path(struct bpf_map *map, const char *path)
+static int pathname_concat(const char *path, const char *name, char *buf)
 {
-	char buf[PATH_MAX];
 	int len;
 
-	if (!path)
-		path = "/sys/fs/bpf";
-
-	len = snprintf(buf, PATH_MAX, "%s/%s", path, bpf_map__name(map));
+	len = snprintf(buf, PATH_MAX, "%s/%s", path, name);
 	if (len < 0)
 		return -EINVAL;
 	else if (len >= PATH_MAX)
 		return -ENAMETOOLONG;
 
+	return 0;
+}
+
+static int build_map_pin_path(struct bpf_map *map, const char *path)
+{
+	char buf[PATH_MAX];
+	int err;
+
+	if (!path)
+		path = "/sys/fs/bpf";
+
+	err = pathname_concat(path, bpf_map__name(map), buf);
+	if (err)
+		return err;
+
 	return bpf_map__set_pin_path(map, buf);
 }
 
@@ -7959,17 +7970,8 @@ int bpf_object__pin_maps(struct bpf_object *obj, const char *path)
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
+			if (pathname_concat(path, bpf_map__name(map), buf))
 				goto err_unpin_maps;
-			}
 			sanitize_pin_path(buf);
 			pin_path = buf;
 		} else if (!map->pin_path) {
@@ -8007,14 +8009,9 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
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
@@ -8032,6 +8029,7 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
 int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 {
 	struct bpf_program *prog;
+	char buf[PATH_MAX];
 	int err;
 
 	if (!obj)
@@ -8043,17 +8041,8 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 	}
 
 	bpf_object__for_each_program(prog, obj) {
-		char buf[PATH_MAX];
-		int len;
-
-		len = snprintf(buf, PATH_MAX, "%s/%s", path, prog->name);
-		if (len < 0) {
-			err = -EINVAL;
+		if (pathname_concat(path, prog->name, buf))
 			goto err_unpin_programs;
-		} else if (len >= PATH_MAX) {
-			err = -ENAMETOOLONG;
-			goto err_unpin_programs;
-		}
 
 		err = bpf_program__pin(prog, buf);
 		if (err)
@@ -8064,13 +8053,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 
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
@@ -8089,13 +8072,10 @@ int bpf_object__unpin_programs(struct bpf_object *obj, const char *path)
 
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

