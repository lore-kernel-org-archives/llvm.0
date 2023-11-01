Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38B12B60
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dki/YcgL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9936b3d0286so1058021666b.0
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698849731; x=1699454531; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GTAZsxjOiJ7tn38oVMXFJSU+JCWK7RkZ77c/9PSTME=;
        b=dki/YcgLCHdQ30Sg9QwL501CbYQTA/HvQjvBZEFaQq4j7oN1ZGDifTLT7D/SeBW+mN
         phKB946Um6Iea5uifxjyvDGKZGh/DeAN4k3c5r7GkrgZrHQL4CjtsFz5VebIx9xBEQON
         lToKbDJK+YCAcPc7LCWow8a5+Pp6IRjfj1tp6rnCA48vL1HWD3wWoRVjCy7NW6/uzDpw
         ksxMcONjT5Ba5MzK3/6o4sAyfsn2InhEWSYr388UihIg/xw8pvSwTSE7GXpKo1aU12lx
         UfWcDk1TyylZ3QStXg3eV5t2j0PHQqMZngHVFUrRdy1epfJuzGGer+qqxj3dZkeoaDbi
         BpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849731; x=1699454531;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GTAZsxjOiJ7tn38oVMXFJSU+JCWK7RkZ77c/9PSTME=;
        b=U0oS6CGyY4cSaNqopodG3yYJvRbqNN1H44Q4sKHZrGfPhMQGadXraqGkkzEHP6fS2I
         f9Dk1ojQPHmm3yK8l8/rUT8WnN+k7D9TrJWtKNQ7hyfVTm6bvZi+cRpLiZTMzM5AXlzs
         qJtqm6TjVkLyRiu9DAK/dfgIsayWx6R9tiQMmBDxl1sy25S3h0vdiYSL64MGzIqYTxEc
         /1F2NS0g1ZAPltGauZSjTMeslO0FcH8ZWkm8x1RX2ti/cOBUd+TOqF7dO++VeZIPEvYi
         GLYAwPkJ8ilqhOsauXH1JIpvxqoDpaRi+jqv80f0QIcg/J6DwB28S9VHLKoGDZCiD1QU
         dM/w==
X-Gm-Message-State: AOJu0YzvN36MRIDIksV6+aSrSadGKMKjJm1VI0aOf9gAtmBZ/FL/tsjP
	Rdukp/MaUUXLdzugkKNPzjjGSChT1q6oX8F3TSU=
X-Google-Smtp-Source: AGHT+IGiBeURkstBQf+ITa3lsDyFq35rvHmkQLgrmlKK7B3dDps3v5aWZ1vOwp/fXS3yx+vzqHrSFQ==
X-Received: by 2002:a17:907:3ea8:b0:9ae:829e:d930 with SMTP id hs40-20020a1709073ea800b009ae829ed930mr2088297ejc.9.1698849730935;
        Wed, 01 Nov 2023 07:42:10 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b009c751e41ebasm6764ejb.141.2023.11.01.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:42:10 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 1 Nov 2023 14:42:09 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1310397379.52558.1698849730427@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.6-rc1-17-g1c6fdbd8f246: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_52557_806662001.1698849729603"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_52557_806662001.1698849729603
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig after:

  | commit v6.6-rc1-17-g1c6fdbd8f246
  | Author: Kent Overstreet <kent.overstreet@gmail.com>
  | Date:   Thu Mar 16 22:18:50 2017 -0800
  | 
  |     bcachefs: Initial commit
  |     
  |     Initially forked from drivers/md/bcache, bcachefs is a new copy-on-write
  |     filesystem with every feature you could possibly want.
  |     
  |     Website: https://bcachefs.org
  |     
  | ... 1 lines of the commit log omitted.

Results changed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23730
# First few build errors in logs:

# 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
# 00:23:17 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/alloc.o] Error 1
# 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:30 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/bset.o] Error 1
# 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is past the end of the array (that has type '__u64[0]' (aka 'unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]

From
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
32815
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/110/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/109/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/reproduction_instructions.txt

Full commit : https://git.linaro.org/kernel-org/linux.git/commit/?id=1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a

Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1015

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-arm-mainline-allmodconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/110/
------=_Part_52557_806662001.1698849729603--
