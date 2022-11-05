Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E6139B
	for <llvm@lists.linux.dev>; Sat,  5 Nov 2022 02:52:28 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id l9so4420043qkk.11
        for <llvm@lists.linux.dev>; Fri, 04 Nov 2022 19:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AM+TWzrl1LA62BHe0rCl520VllgtghOrkiBcfVyQb4=;
        b=k0Jh0XkldmG8RANLS2K0+hj/5w/Kw+FdUYVrURoqA7WDh0Cm+uv9mOX10JkCNnS8NJ
         HnB4UGIL5WLZvvMH3MsOcD+Rf5i9kIMyTb0m/u7WvBBMjDxVshVSlBXaVUxbQYaorf4Z
         OLcdorfXmCYAdSAhlx0C89D8FytECOj9mSMNpOvT6YfMUIkDht2u5TNrPzYPjjFbeVDb
         v0mIxpscJB/OfPsp7LQOW2k22IH6mPkz5lPZgj4qFhS8ib1LgKpnXpkxSKLhoewt0uT9
         iKao+31zZbLgnTvRyZWUSR+EzAhR2j5PPyZ1MVEAZt8LKQab3ub+qFmnTFYeJiF49ZJi
         RXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AM+TWzrl1LA62BHe0rCl520VllgtghOrkiBcfVyQb4=;
        b=Fu0KOJzKxg9cVhIwkU0BwPspXBncuRYH2GVwLPSCdF8/xtZVfzVZSuJRXgnHHeNoBP
         DJDaIWcmEMT3ObrOLinYMqW7adU4RF44hqNkfWxdCWy8WqleSFpss7gTnL+Otc2+PBnY
         oZ2O/JRxHxeenKKX0UwnWQq0jaPT5lL7A/MFUTTtumZ2brP3SAhJ3KodKsrVsM6DvI0k
         fthZiorcIJf4v2GPnCKkwJHB9TwNnqlw81qIBE7mQvns0UOXItzqYnX7s3+e7qwcEs3m
         FddOrPvhQhhU97MMthf59bCm/vykbTO+ReheKkyZIpFMXUo9YaNvAqZufMYEZV0aLjPg
         Gnqg==
X-Gm-Message-State: ACrzQf2pAE5BCfK/R8BIpzUUUOXhG4Vq5YxoovVakD2yjJGNcmbTcrTc
	QD5siyc7dB6ebBgiqZqj5JZZjg==
X-Google-Smtp-Source: AMsMyM4MQv6UKhI6oTX/XUK87tqEv89kBUPr7uFlabbYsRKtpfFOFV6tyueovJAuZtJwRodaCLiNpQ==
X-Received: by 2002:a05:620a:21c9:b0:6fa:3046:42c0 with SMTP id h9-20020a05620a21c900b006fa304642c0mr21689269qka.628.1667616747823;
        Fri, 04 Nov 2022 19:52:27 -0700 (PDT)
Received: from 192-168-53-12.byted.org ([130.44.212.119])
        by smtp.gmail.com with ESMTPSA id ay14-20020a05620a178e00b006bb366779a4sm805905qkb.6.2022.11.04.19.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 19:52:27 -0700 (PDT)
From: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jiri Olsa <olsajiri@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Quentin Monnet <quentin@isovalent.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kui-Feng Lee <kuifeng@fb.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Maxim Mikityanskiy <maximmi@nvidia.com>,
	Hao Xiang <hao.xiang@bytedance.com>,
	Punit Agrawal <punit.agrawal@bytedance.com>,
	Yifei Ma <yifeima@bytedance.com>,
	Xiaoning Ding <xiaoning.ding@bytedance.com>,
	bpf@vger.kernel.org
Cc: Ho-Ren Chuang <horenc@vt.edu>,
	Ho-Ren Chuang <horenchuang@bytedance.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v1 2/4] bpftool: Add tools support to show BPF htab map's used size
Date: Sat,  5 Nov 2022 02:51:44 +0000
Message-Id: <20221105025146.238209-3-horenchuang@bytedance.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221105025146.238209-1-horenchuang@bytedance.com>
References: <20221105025146.238209-1-horenchuang@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bpftool support for reporting the number of used entries of
htab maps by leveraging the newly added "used_entries" field in
struct bpf_map_info. It works with JSON as well.

To better understand actual used memory size of a htab map,
pre-allocated maps are now marked with "*" behind the "max_entries" size.

Signed-off-by: Ho-Ren (Jack) Chuang <horenchuang@bytedance.com>
---
 tools/bpf/bpftool/map.c        | 9 +++++++--
 tools/include/uapi/linux/bpf.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 9a6ca9f31133..0b07abae7309 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -475,6 +475,8 @@ static int show_map_close_json(int fd, struct bpf_map_info *info)
 	jsonw_uint_field(json_wtr, "bytes_key", info->key_size);
 	jsonw_uint_field(json_wtr, "bytes_value", info->value_size);
 	jsonw_uint_field(json_wtr, "max_entries", info->max_entries);
+	if (info->type == BPF_MAP_TYPE_HASH)
+		jsonw_uint_field(json_wtr, "used_entries", info->used_entries);
 
 	if (memlock)
 		jsonw_int_field(json_wtr, "bytes_memlock", atoll(memlock));
@@ -561,8 +563,11 @@ static int show_map_close_plain(int fd, struct bpf_map_info *info)
 	frozen_str = get_fdinfo(fd, "frozen");
 
 	show_map_header_plain(info);
-	printf("\tkey %uB  value %uB  max_entries %u",
-	       info->key_size, info->value_size, info->max_entries);
+	printf("\tkey %uB  value %uB  max_entries %u%1s",
+		   info->key_size, info->value_size, info->max_entries,
+		   !(info->map_flags & BPF_F_NO_PREALLOC) ? "*" : "");
+	if (info->type == BPF_MAP_TYPE_HASH)
+		printf("  used_entries %u", info->used_entries);
 
 	if (memlock)
 		printf("  memlock %sB", memlock);
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 17f61338f8f8..63659368cf0e 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -6215,6 +6215,7 @@ struct bpf_map_info {
 	__u32 id;
 	__u32 key_size;
 	__u32 value_size;
+	__u32 used_entries;
 	__u32 max_entries;
 	__u32 map_flags;
 	char  name[BPF_OBJ_NAME_LEN];
-- 
Ho-Ren (Jack) Chuang

