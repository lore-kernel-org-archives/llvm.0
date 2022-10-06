Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B5A5A
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 16:31:35 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id y136so2535112pfb.3
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cdMzhQEQcFa5DYBl61C/dTx0BJyMbEUFFUGqg6nuolc=;
        b=JJZKLJQ9ESIoLIKvjAmFpZUURPe8z6MIa+7cNRi5o4I0FMMyWrlnWTvIaevUfx+9HY
         uMMbVif9VWDtjHhTrN9xvgNAK7wRBw/lOoGBs/sT0X2F0hKiBpYBKgpt3jUElL6fgbXL
         obZOsviIsiokc4CQ33D6WrdyL4gTezkZaSARlXq9vyp62j7SSjrmgOvm4blDj5Aya68J
         Zi+Tp4L0cKObTAYbQ5YxT1t3GZ7D+W1S37MIuijI3E05GOW1HtthzzMBe0qHhvDgWhW9
         13khzukWOKg1f5aI+3dfYzPJKDVPm+RARfinJepYYq+nNgRH4yrOuJfwYorCckVOF2SS
         4h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cdMzhQEQcFa5DYBl61C/dTx0BJyMbEUFFUGqg6nuolc=;
        b=IPWGpq4GNKjO71ZTADuSZiOswAtkAKo3/ZH9eVmW6BCyNWjBfHFYHAfT/ksyl3iq+o
         9MpLcaFXF8M7wht2xuAyq/dUCJT/JlRL9fOqz+fcPOm9sQ3EGyIjVDIChySf9UEyF++g
         ksOkhJh1j5HJVF8a1zPVr8/XVs5SrE/p/uBB6n+w7bt1ULpR81C5DhOh3kzBuSn4fD+2
         wYtGu+3nMd6LjeyEgsjOErOZaxIACMWNz+wntxznRV98i5khrOrtEdR7WD1M8OaNq+8o
         BQkFaufx+YXdamk7kuWqOpJrpaRuga+d+lbmI2qd4dLo3XUSeBzIJHCsj8nseh7yyFoq
         0guA==
X-Gm-Message-State: ACrzQf0xTVR2RdQQIPBQrfHVHgTVg3BFAT00M4lpEcthR8VkNw1/M0c4
	/TK7Ir/Mt8YcYUCzlPHuhU8/ewJTWSlmnGADe1uNuRdI6FLdgA==
X-Google-Smtp-Source: AMsMyM4KCUCvqinYmR+h4Kdd9FKQLxOX7NFWB/0K2A/DoG2oqCsibUgk6lJ8ImuUgX//0SSsHeznAQCpufCD4haZZmA=
X-Received: by 2002:a62:1a97:0:b0:562:5587:12d6 with SMTP id
 a145-20020a621a97000000b00562558712d6mr271569pfa.37.1665073894419; Thu, 06
 Oct 2022 09:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1439159046.7402.1665035676485@jenkins.jenkins>
In-Reply-To: <1439159046.7402.1665035676485@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 6 Oct 2022 09:31:22 -0700
Message-ID: <CAKwvOdnzXnF5-i01ga1R+pbQyonPdyXhiTnAh3jmwvfy1UuyqQ@mail.gmail.com>
Subject: Re: [TCWG CI] Failure after v6.0-rc7-4-ga3a956c78efa: fs/ntfs3: Add
 option "nocase"
To: ci_notify@linaro.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, llvm@lists.linux.dev, 
	arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"

https://lore.kernel.org/llvm/20221004232359.285685-1-nathan@kernel.org/

On Wed, Oct 5, 2022 at 10:54 PM <ci_notify@linaro.org> wrote:
>
> Failure after v6.0-rc7-4-ga3a956c78efa: fs/ntfs3: Add option "nocase":
>
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21253
> # First few build errors in logs:
> # 00:15:10 fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> # 00:15:10 fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> # 00:15:10 make[2]: *** [scripts/Makefile.build:249: fs/ntfs3/namei.o] Error 1
> # 00:15:29 make[1]: *** [scripts/Makefile.build:465: fs/ntfs3] Error 2
> # 00:29:06 make: *** [Makefile:1852: fs] Error 2
>
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21329
> # linux build successful:
> all
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
> Status of v6.0-rc7-4-ga3a956c78efa commit for tcwg_kernel:
> commit a3a956c78efaa202b1d75190136671cf6e87bfbe
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Fri Sep 23 12:42:18 2022 +0300
>
>     fs/ntfs3: Add option "nocase"
>
>     This commit adds mount option and additional functions.
>
>     Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> * llvm-release-aarch64-next-allyesconfig
> ** Failure after v6.0-rc7-4-ga3a956c78efa: fs/ntfs3: Add option "nocase":
> ** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/422/
>
> Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/422/artifact/artifacts
> Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/421/artifact/artifacts
>
> Reproduce current build:
> <cut>
> mkdir -p investigate-linux-a3a956c78efaa202b1d75190136671cf6e87bfbe
> cd investigate-linux-a3a956c78efaa202b1d75190136671cf6e87bfbe
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests for bad and good builds
> mkdir -p bad/artifacts good/artifacts
> curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/422/artifact/artifacts/manifest.sh --fail
> curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/421/artifact/artifacts/manifest.sh --fail
>
> # Reproduce bad build
> (cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> # Reproduce good build
> (cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit a3a956c78efaa202b1d75190136671cf6e87bfbe
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Fri Sep 23 12:42:18 2022 +0300
>
>     fs/ntfs3: Add option "nocase"
>
>     This commit adds mount option and additional functions.
>
>     Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/index.c   |   2 +-
>  fs/ntfs3/namei.c   | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/ntfs3/ntfs_fs.h |   4 ++
>  fs/ntfs3/super.c   |   6 +++
>  fs/ntfs3/upcase.c  |  12 +++++
>  5 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 440328147e7e..613036f9c6e6 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -47,7 +47,7 @@ static int cmp_fnames(const void *key1, size_t l1, const void *key2, size_t l2,
>         if (l2 < fsize2)
>                 return -1;
>
> -       both_case = f2->type != FILE_NAME_DOS /*&& !sbi->options.nocase*/;
> +       both_case = f2->type != FILE_NAME_DOS && !sbi->options->nocase;
>         if (!l1) {
>                 const struct le_str *s2 = (struct le_str *)&f2->name_len;
>
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index bc22cc321a74..315763eb05ff 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/fs.h>
>  #include <linux/nls.h>
> +#include <linux/ctype.h>
>
>  #include "debug.h"
>  #include "ntfs.h"
> @@ -355,6 +356,138 @@ struct dentry *ntfs3_get_parent(struct dentry *child)
>         return ERR_PTR(-ENOENT);
>  }
>
> +/*
> + * dentry_operations::d_hash
> + */
> +static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
> +{
> +       struct ntfs_sb_info *sbi;
> +       const char *n = name->name;
> +       unsigned int len = name->len;
> +       unsigned long hash;
> +       struct cpu_str *uni;
> +       unsigned int c;
> +       int err;
> +
> +       /* First try fast implementation. */
> +       hash = init_name_hash(dentry);
> +
> +       for (;;) {
> +               if (!len--) {
> +                       name->hash = end_name_hash(hash);
> +                       return 0;
> +               }
> +
> +               c = *n++;
> +               if (c >= 0x80)
> +                       break;
> +
> +               hash = partial_name_hash(toupper(c), hash);
> +       }
> +
> +       /*
> +        * Try slow way with current upcase table
> +        */
> +       uni = __getname();
> +       if (!uni)
> +               return -ENOMEM;
> +
> +       sbi = dentry->d_sb->s_fs_info;
> +
> +       err = ntfs_nls_to_utf16(sbi, name->name, name->len, uni, NTFS_NAME_LEN,
> +                               UTF16_HOST_ENDIAN);
> +       if (err < 0)
> +               goto out;
> +
> +       if (!err) {
> +               err = -EINVAL;
> +               goto out;
> +       }
> +
> +       hash = ntfs_names_hash(uni->name, uni->len, sbi->upcase,
> +                              init_name_hash(dentry));
> +       name->hash = end_name_hash(hash);
> +       err = 0;
> +
> +out:
> +       __putname(uni);
> +       return err;
> +}
> +
> +/*
> + * dentry_operations::d_compare
> + */
> +static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
> +                         const char *str, const struct qstr *name)
> +{
> +       struct ntfs_sb_info *sbi;
> +       int ret;
> +       const char *n1 = str;
> +       const char *n2 = name->name;
> +       unsigned int len2 = name->len;
> +       unsigned int lm = min(len1, len2);
> +       unsigned char c1, c2;
> +       struct cpu_str *uni1, *uni2;
> +
> +       /* First try fast implementation. */
> +       for (;;) {
> +               if (!lm--) {
> +                       ret = len1 == len2 ? 0 : 1;
> +                       goto out;
> +               }
> +
> +               if ((c1 = *n1++) == (c2 = *n2++))
> +                       continue;
> +
> +               if (c1 >= 0x80 || c2 >= 0x80)
> +                       break;
> +
> +               if (toupper(c1) != toupper(c2)) {
> +                       ret = 1;
> +                       goto out;
> +               }
> +       }
> +
> +       /*
> +        * Try slow way with current upcase table
> +        */
> +       sbi = dentry->d_sb->s_fs_info;
> +       uni1 = __getname();
> +       if (!uni1)
> +               return -ENOMEM;
> +
> +       ret = ntfs_nls_to_utf16(sbi, str, len1, uni1, NTFS_NAME_LEN,
> +                               UTF16_HOST_ENDIAN);
> +       if (ret < 0)
> +               goto out;
> +
> +       if (!ret) {
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       uni2 = Add2Ptr(uni1, 2048);
> +
> +       ret = ntfs_nls_to_utf16(sbi, name->name, name->len, uni2, NTFS_NAME_LEN,
> +                               UTF16_HOST_ENDIAN);
> +       if (ret < 0)
> +               goto out;
> +
> +       if (!ret) {
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       ret = !ntfs_cmp_names(uni1->name, uni1->len, uni2->name, uni2->len,
> +                             sbi->upcase, false)
> +                     ? 0
> +                     : 1;
> +
> +out:
> +       __putname(uni1);
> +       return ret;
> +}
> +
>  // clang-format off
>  const struct inode_operations ntfs_dir_inode_operations = {
>         .lookup         = ntfs_lookup,
> @@ -382,4 +515,10 @@ const struct inode_operations ntfs_special_inode_operations = {
>         .get_acl        = ntfs_get_acl,
>         .set_acl        = ntfs_set_acl,
>  };
> +
> +const struct dentry_operations ntfs_dentry_ops = {
> +       .d_hash         = ntfs_d_hash,
> +       .d_compare      = ntfs_d_compare,
> +};
> +
>  // clang-format on
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index cd680ada50ab..6c1c7ef3b2d6 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -101,6 +101,7 @@ struct ntfs_mount_options {
>         unsigned force : 1; /* RW mount dirty volume. */
>         unsigned noacsrules : 1; /* Exclude acs rules. */
>         unsigned prealloc : 1; /* Preallocate space when file is growing. */
> +       unsigned nocase : 1; /* case insensitive. */
>  };
>
>  /* Special value to unpack and deallocate. */
> @@ -721,6 +722,7 @@ struct dentry *ntfs3_get_parent(struct dentry *child);
>
>  extern const struct inode_operations ntfs_dir_inode_operations;
>  extern const struct inode_operations ntfs_special_inode_operations;
> +extern const struct dentry_operations ntfs_dentry_ops;
>
>  /* Globals from record.c */
>  int mi_get(struct ntfs_sb_info *sbi, CLST rno, struct mft_inode **mi);
> @@ -840,6 +842,8 @@ int ntfs_cmp_names(const __le16 *s1, size_t l1, const __le16 *s2, size_t l2,
>                    const u16 *upcase, bool bothcase);
>  int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
>                        const u16 *upcase, bool bothcase);
> +unsigned long ntfs_names_hash(const u16 *name, size_t len, const u16 *upcase,
> +                             unsigned long hash);
>
>  /* globals from xattr.c */
>  #ifdef CONFIG_NTFS3_FS_POSIX_ACL
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 87d9eabf9847..d72a27abf1c8 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -253,6 +253,7 @@ enum Opt {
>         Opt_iocharset,
>         Opt_prealloc,
>         Opt_noacsrules,
> +       Opt_nocase,
>         Opt_err,
>  };
>
> @@ -272,6 +273,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
>         fsparam_flag_no("showmeta",             Opt_showmeta),
>         fsparam_flag_no("prealloc",             Opt_prealloc),
>         fsparam_flag_no("acsrules",             Opt_noacsrules),
> +       fsparam_flag_no("nocase",               Opt_nocase),
>         fsparam_string("iocharset",             Opt_iocharset),
>         {}
>  };
> @@ -383,6 +385,9 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
>         case Opt_noacsrules:
>                 opts->noacsrules = result.negated ? 1 : 0;
>                 break;
> +       case Opt_nocase:
> +               opts->nocase = result.negated ? 1 : 0;
> +               break;
>         default:
>                 /* Should not be here unless we forget add case. */
>                 return -EINVAL;
> @@ -936,6 +941,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>         sb->s_export_op = &ntfs_export_ops;
>         sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
>         sb->s_xattr = ntfs_xattr_handlers;
> +       sb->s_d_op = sbi->options->nocase ? &ntfs_dentry_ops : NULL;
>
>         sbi->options->nls = ntfs_load_nls(sbi->options->nls_name);
>         if (IS_ERR(sbi->options->nls)) {
> diff --git a/fs/ntfs3/upcase.c b/fs/ntfs3/upcase.c
> index b5e8256fd710..7681eefacb4b 100644
> --- a/fs/ntfs3/upcase.c
> +++ b/fs/ntfs3/upcase.c
> @@ -102,3 +102,15 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
>         diff2 = l1 - l2;
>         return diff2 ? diff2 : diff1;
>  }
> +
> +/* Helper function for ntfs_d_hash. */
> +unsigned long ntfs_names_hash(const u16 *name, size_t len, const u16 *upcase,
> +                             unsigned long hash)
> +{
> +       while (len--) {
> +               unsigned int c = upcase_unicode_char(upcase, *name++);
> +               hash = partial_name_hash(c, hash);
> +       }
> +
> +       return hash;
> +}
> </cut>



-- 
Thanks,
~Nick Desaulniers
