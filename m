Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A7BD1A
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 22:32:41 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id y1so9515736wru.2
        for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 14:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7j/opjQcBJFhO/7sFqax3PHAlfqJlQKdnWL2pZ2q83A=;
        b=TSg4mLdkDrnwNmUqL3w8We7X9Eo6dMUwEkxAWakF+TPnXA83gh1mTWh8r3WvpCTXy1
         CeR7lMPHldfNn5r9parql1rTWVEHdimfe45wemDlw66owyZQN0OkI74HUKvbLSAkzhKX
         sTPd1etlRsjyTLmm3nZ5yAgAdRf7F1doGkmxl6/yA0VUocrARmEkNJZ96nY61SRuBjsp
         mTIkcGiS7/uQF+UrpxCSvdZt39a+mdTVf7mOyHgcqL3j4HosW2LLl7LkS/GaJK/+cY+2
         3Tle3X5AE5fiWITjNwJYNGylo3vOTQkql9/zwt6YfSOd81zg33cUniiODbKgTtRKtL35
         C76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7j/opjQcBJFhO/7sFqax3PHAlfqJlQKdnWL2pZ2q83A=;
        b=lQY+0+yzns70Nr2ts+ulkSsceCEUlW4JJMSWGbWtqtDwijnfB8GiMq7ERsrmzi/jMb
         K7+g5K0AEXEI4qok4r1iCCLL5DkalpWf9YTX8HyrFLpx47hFXwIHjkQH7J4o+eECQDy9
         yc8FYgf5yjCiJIEl+w8sb9Ja2oMXroJpiRhl+snSbjRgPqXeLWIimcq213s7acsreBSn
         OuhpeRCAbQ6yRU9xaGiu+cPeAGmLXQCIZSZ5KomOvsCp+MJ/P1qU2OtmG1HECuXlAx2R
         Z4zdcHggynG4YpHBOB3HxY23C+mxORmgLMgor3GZQT8zyp1Gty6cZShwNg5kOdpFr1ZF
         w80Q==
X-Gm-Message-State: AO0yUKUb0Bmy5BVajsCYdCbMEPAgCk79cT+EbelFeK16Mpx+l7LcvOh/
	tY2fkORzt/MjN83MSpN6miUBhA==
X-Google-Smtp-Source: AK7set8fSBM8ef7siY+iN0tVgmY/86gjTqL6gndqYy1+Mqo+6f8rLqEO7lVtPCWu80QI60x78yJC3Q==
X-Received: by 2002:adf:d1ee:0:b0:2bf:e5cc:91c1 with SMTP id g14-20020adfd1ee000000b002bfe5cc91c1mr4352438wrd.52.1675031559808;
        Sun, 29 Jan 2023 14:32:39 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d44c4000000b002bfcc9d9607sm9084623wrr.68.2023.01.29.14.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 14:32:39 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 29 Jan 2023 22:32:37 +0000 (UTC)
To: Jan Kara <jack@suse.cz>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1030144190.6515.1675031559447@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc3-45-gbd904f3c7496: udf: Unify types
 in anchor block detection
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6514_2047847466.1675031558898"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_6514_2047847466.1675031558898
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc3-45-gbd904f3c7496: udf: Unify types in anchor block detection:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21636
# First few build errors in logs:
# 01:01:50 fs/udf/super.c:1942:29: error: incompatible pointer types passing 'sector_t *' (aka 'unsigned long long *') to parameter of type 'udf_pblk_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
# 01:01:50 fs/udf/super.c:1950:29: error: incompatible pointer types passing 'sector_t *' (aka 'unsigned long long *') to parameter of type 'udf_pblk_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
# 01:01:50 fs/udf/super.c:1956:29: error: incompatible pointer types passing 'sector_t *' (aka 'unsigned long long *') to parameter of type 'udf_pblk_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
# 01:01:50 make[3]: *** [scripts/Makefile.build:252: fs/udf/super.o] Error 1
# 01:02:34 make[2]: *** [scripts/Makefile.build:504: fs/udf] Error 2
# 01:40:30 make[1]: *** [scripts/Makefile.build:504: fs] Error 2
# 01:55:42 make: *** [Makefile:2008: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21715
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc3-45-gbd904f3c7496 commit for tcwg_kernel:
commit bd904f3c74969442b0ac42f81c0d02da54cd47eb
Author: Jan Kara <jack@suse.cz>
Date:   Wed Jan 18 13:55:31 2023 +0100

    udf: Unify types in anchor block detection
    
    When detecting last recorded block and from it derived anchor block
    position, we were mixing unsigned long, u32, and sector_t types. Since
    udf supports only 32-bit block numbers this is harmless but sometimes
    makes things awkward. Convert everything to udf_pblk_t and also handle
    the situation when block device size would not fit into udf_pblk_t.
    
    Signed-off-by: Jan Kara <jack@suse.cz>
* llvm-master-aarch64-next-allyesconfig
** Failure after v6.2-rc3-45-gbd904f3c7496: udf: Unify types in anchor block detection:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/740/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/740/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/739/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-bd904f3c74969442b0ac42f81c0d02da54cd47eb
cd investigate-linux-bd904f3c74969442b0ac42f81c0d02da54cd47eb

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/740/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/739/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit bd904f3c74969442b0ac42f81c0d02da54cd47eb
Author: Jan Kara <jack@suse.cz>
Date:   Wed Jan 18 13:55:31 2023 +0100

    udf: Unify types in anchor block detection
    
    When detecting last recorded block and from it derived anchor block
    position, we were mixing unsigned long, u32, and sector_t types. Since
    udf supports only 32-bit block numbers this is harmless but sometimes
    makes things awkward. Convert everything to udf_pblk_t and also handle
    the situation when block device size would not fit into udf_pblk_t.
    
    Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/udf/lowlevel.c | 7 +++++--
 fs/udf/super.c    | 4 ++--
 fs/udf/udfdecl.h  | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/udf/lowlevel.c b/fs/udf/lowlevel.c
index 46d697172197..c87ed942d076 100644
--- a/fs/udf/lowlevel.c
+++ b/fs/udf/lowlevel.c
@@ -45,7 +45,7 @@ unsigned int udf_get_last_session(struct super_block *sb)
 	return 0;
 }
 
-unsigned long udf_get_last_block(struct super_block *sb)
+udf_pblk_t udf_get_last_block(struct super_block *sb)
 {
 	struct cdrom_device_info *cdi = disk_to_cdi(sb->s_bdev->bd_disk);
 	unsigned long lblock = 0;
@@ -54,8 +54,11 @@ unsigned long udf_get_last_block(struct super_block *sb)
 	 * The cdrom layer call failed or returned obviously bogus value?
 	 * Try using the device size...
 	 */
-	if (!cdi || cdrom_get_last_written(cdi, &lblock) || lblock == 0)
+	if (!cdi || cdrom_get_last_written(cdi, &lblock) || lblock == 0) {
+		if (sb_bdev_nr_blocks(sb) > ~(udf_pblk_t)0)
+			return 0;
 		lblock = sb_bdev_nr_blocks(sb);
+	}
 
 	if (lblock)
 		return lblock - 1;
diff --git a/fs/udf/super.c b/fs/udf/super.c
index 241b40e886b3..c756d903a862 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1861,10 +1861,10 @@ static int udf_check_anchor_block(struct super_block *sb, sector_t block,
  * Returns < 0 on error, 0 on success. -EAGAIN is special - try next set
  * of anchors.
  */
-static int udf_scan_anchors(struct super_block *sb, sector_t *lastblock,
+static int udf_scan_anchors(struct super_block *sb, udf_pblk_t *lastblock,
 			    struct kernel_lb_addr *fileset)
 {
-	sector_t last[6];
+	udf_pblk_t last[6];
 	int i;
 	struct udf_sb_info *sbi = UDF_SB(sb);
 	int last_count = 0;
diff --git a/fs/udf/udfdecl.h b/fs/udf/udfdecl.h
index d35aa42bb577..eaf9e6fd201e 100644
--- a/fs/udf/udfdecl.h
+++ b/fs/udf/udfdecl.h
@@ -196,7 +196,7 @@ extern void udf_new_tag(char *, uint16_t, uint16_t, uint16_t, uint32_t, int);
 
 /* lowlevel.c */
 extern unsigned int udf_get_last_session(struct super_block *);
-extern unsigned long udf_get_last_block(struct super_block *);
+udf_pblk_t udf_get_last_block(struct super_block *);
 
 /* partition.c */
 extern uint32_t udf_get_pblock(struct super_block *, uint32_t, uint16_t,
</cut>
------=_Part_6514_2047847466.1675031558898--
