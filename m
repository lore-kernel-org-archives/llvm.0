Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4D17CB;
	Wed, 14 Dec 2022 05:37:30 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-01.nifty.com with ESMTP id 2BE5VLZd000963;
	Wed, 14 Dec 2022 14:31:21 +0900
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 2BE5V62d018027;
	Wed, 14 Dec 2022 14:31:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 2BE5V62d018027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1670995866;
	bh=K8KlusuI7cS+JOyW8VSoKLpeNpoqL1EAxCZU6kXpj0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=2QBelH2kavu7MaCQ5lKNT8q7TW8JEPpYE3vwt1hOCiOAqCL39j19f6MgMvTejg1zJ
	 Zv/FkIFMENDaMF86Ne6BdDxDnxNUl8nD6RTcD8cx2BfGH5tTAoHlGrqLboa/YS5Gc+
	 ro2sGhueDd25vAG9s4YQIr3OvZcNbl0HHDyMCcDBVSzIw6r/0E77Wl9dzi32x1Pnhf
	 qcMBhJrSWzUUm1jjPPII/QEjUtIxIdFHD43MwVNCO7ZzyQzrLfCJ9rT4S9y+CFe2oN
	 8O4YyihoRWJ50l0PkzmL+SKE5+hLfrLCSqUQyYxdQTXOK1ELFCq6QePaEyjb/HDxKp
	 JpoC4RpyF2OSw==
X-Nifty-SrcIP: [209.85.167.180]
Received: by mail-oi1-f180.google.com with SMTP id v70so1811407oie.3;
        Tue, 13 Dec 2022 21:31:06 -0800 (PST)
X-Gm-Message-State: ANoB5pmrBxeuuK/TL3sNNBBuwQ3k5ZGLsoleSc84qVwPiqG8RLWwedgp
	DrC6BHYfYDowgUcKVf6GpqnkF+eA5UrVt5ZLojg=
X-Google-Smtp-Source: AA0mqf6xmTHhmERk+DoxxXYuZ3lpNFYZu84eb65h58mUM/aj0b/pO5pEsGOir8k8g7bU8UiSCwMfOvKaqLkq8i3j4e0=
X-Received: by 2002:aca:1709:0:b0:35e:7c55:b015 with SMTP id
 j9-20020aca1709000000b0035e7c55b015mr62466oii.287.1670995865176; Tue, 13 Dec
 2022 21:31:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212141108.c44xlimX-lkp@intel.com>
In-Reply-To: <202212141108.c44xlimX-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 14 Dec 2022 14:30:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHP83jqA+OogqSBPd+0=FgD-W++xdowP28TvWP=ztudA@mail.gmail.com>
Message-ID: <CAK7LNAQHP83jqA+OogqSBPd+0=FgD-W++xdowP28TvWP=ztudA@mail.gmail.com>
Subject: Re: [masahiroy:kbuild 24/26] ERROR: modpost: "kvm_spurious_fault"
 [arch/x86/kvm/kvm-intel.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 14, 2022 at 12:55 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   83e4033293b479f1d57f17f852bd0d7be278c962
> commit: 558dd3618c0577e8416a93a94b950daf5a2e419b [24/26] kbuild: change module.order to list *.o instead of *.ko
> config: i386-randconfig-a002
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=558dd3618c0577e8416a93a94b950daf5a2e419b
>         git remote add masahiroy https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch --no-tags masahiroy kbuild
>         git checkout 558dd3618c0577e8416a93a94b950daf5a2e419b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
> WARNING: modpost: suppressed 38231 unresolved symbol warnings because there were too many)
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp


Thanks, I missed to adjust scripts/gen_autoksyms.sh

diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 653fadbad302..12bcfae940ee 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -48,7 +48,7 @@ cat > "$output_file" << EOT
 EOT

 {
-       [ -n "${read_modorder}" ] && sed 's/ko$/usyms/' modules.order
| xargs cat
+       [ -n "${read_modorder}" ] && sed 's/o$/usyms/' modules.order | xargs cat
        echo "$needed_symbols"
        [ -n "$ksym_wl" ] && cat "$ksym_wl"
 } | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |




-- 
Best Regards
Masahiro Yamada
