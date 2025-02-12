Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54D101E6
	for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321785; cv=none; b=ntd1oyhgW4lBMctCuQ634SLO+BA3/WZ1ep4lFeT3yUEDzU4cyG/UZ0Hw5hUVoFoqnPaVC0lyor1UPhRf6jYihqeRJTcZ7FGiQhNmJsu5gZBqgV/S1cfGkM64tjybXHXY4dGBdbdvgCRMfIWB639HFesrYmmJ/Jn4m54ZCyCDWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321785; c=relaxed/simple;
	bh=e+BLwSgSHjy9yBuT4YO1wwabPYPHQNi+gOE3i7/aaBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbSDYR3q50gSF/hYPx4Rdp3kTK/V/LjaxfwDTneeRp4sW5jalMyQRFwAS8DJmtEv1eHWfOw2RAAc6I2vHeNO8sPff6hIpcu5X69/l2g9ZLFg1kelS2xTPvjxtL/WTa6l1g2EYBNy1bQHcGIn3LkSJPdf9jSK4hCKvoyd38COWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nhu1ENbj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nhu1ENbj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f8c280472so33455ad.1
        for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 16:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739321783; x=1739926583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivh9AzheXIKHdwI+6JcoW6n5m0LCFzWHrb18akb3wpw=;
        b=nhu1ENbjUfkbkpRLkQ4uAzdsFHU4WOJjXT3lMaNm6xqBTvgGQglib/RxeT/K3mvh8m
         Ytv3LKRwYrndctYomeA+FYvbFTBr9exyxCKN6hqGQorIaKHXjz1svSuY9Ttl0Jp1na+l
         DXy5dqwCFpLAGhcs5t5XndmJKumsWXphdzmP8taEMWLP4V4Kp1GtTimPKLLz8lEuTn+9
         3cOW1C2sW57FHMh4NCvVV8XRvVOxz8jBY4Kk9eEx0W1X8AzNw4+xuYaBLOS1JTDXH4WG
         QRuj6b7od4ZAfUK8hpZ+eMjjCX+yS3q8wL+iw9qm2jwtVanJDpZZP3bmaUOBfI5iQDxV
         uLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321783; x=1739926583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ivh9AzheXIKHdwI+6JcoW6n5m0LCFzWHrb18akb3wpw=;
        b=L/k00qKDyE4eWV8OoPfRUA/1sB+YxwRtWJkNfkUlbjUy+zZOwXDCjEmDLUtAQWYvkB
         k8JxjEzbzL+oTbbATkoM+RODNt6uYqJBcb5CvkvVQE14DBTjkoDOc6JFHH0HJw4wOycG
         xgOZKjcSSPD3Sppwd+xYgoa4Nn8FVltDCvjEw3geyTH0HVYn5D0AYH3NtA7l1Qy29szt
         4G5xmFPHpBZgFfpq1f+97kbcz3n3NNeCI4/uvaTFfzlvKYtssQP2kKoPeDicCC07Aygw
         kEBVOqpI8XLuZkoX4R1J4zrGnDW9l0VRgmGU+YR8AfqMJWqTp/r1MOgDAwQPD+2KHN/u
         BSnA==
X-Gm-Message-State: AOJu0Yx+pF3iLxYMqhb8eMfHngBrJTuTfpTMnpuMcedOrbHe1UxeAs/z
	Cu6pjby5PN6DPgYz+R6h7OhGAy8GQd7+Itvf4uAvwOw3NhURJ4IIjj4b8rqGuw==
X-Gm-Gg: ASbGnctcGEFtdxhRKHWhazRU9bw+AxEEyAo+WZloUCIODWE+owoNnjKwRHklxFjlmxc
	WnXBNq9UX4q7mIygKG8Tj6CrxphkFoIpJBTBLJRAyg0K4aXh9H4TGcPWC40q+2A4RhPI9OvL7aH
	1kZhPUkbXmBpzM9xpb+GGgANKfFCG4vIU7wS6VL0O2cAjDkNgSlCK17N2EplLr5DB0kk/oxQpJu
	l22nVOsV/9WW+st0FPRtv2z6GaALaXZV1Dslwg6d7tpMhJaOMTjISDhOHMtGWyP0jcMabyeq1Dt
	9dpqznrxM8GYAn5OjkdBfumH7af4p8/WBsI61mIVeJs5ZsLZYgQOmRVAH6/eog==
X-Google-Smtp-Source: AGHT+IE1AfJuJzaHf2oysXFlqioTFb+uK5152VMOgYK5OLbaKeSNVULBQuOJ5dxwdZzPVqNLcrYZHQ==
X-Received: by 2002:a17:903:19e6:b0:216:2839:145 with SMTP id d9443c01a7336-220befcac4bmr648985ad.1.1739321782337;
        Tue, 11 Feb 2025 16:56:22 -0800 (PST)
Received: from google.com (154.164.227.35.bc.googleusercontent.com. [35.227.164.154])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d0765sm187583a91.20.2025.02.11.16.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:56:21 -0800 (PST)
Date: Wed, 12 Feb 2025 00:56:17 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: error: gendwarfksyms: process_module: dwarf_get_units failed: no
 debugging information?
Message-ID: <20250212005617.GA1701202@google.com>
References: <202502120752.U3fOKScQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502120752.U3fOKScQ-lkp@intel.com>

On Wed, Feb 12, 2025 at 07:55:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
> commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksyms as an alternative to genksyms
> date:   5 weeks ago
> config: s390-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120752.U3fOKScQ-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120752.U3fOKScQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502120752.U3fOKScQ-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?
> --
>    In file included from <stdin>:3:
>    In file included from arch/s390/include/asm/asm-prototypes.h:4:
> >> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variable sized type 'struct kvm_stats_desc' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>     1908 |         struct kvm_stats_desc desc;
>          |                               ^
>    1 warning generated.
> >> error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?

The issue appears to be that the files in arch/s390/purgatory are
always built without debugging information, even though they include
code that uses EXPORT_SYMBOL.

I suspect the correct solution here is to ignore the object files in
this directory when calculating modversions. The quick patch below
fixes the build issue for me. Masahiro, does this look reasonable to
you?

Sami


diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index bdcf2a3b6c41..bdcecc19441d 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -28,6 +28,8 @@ KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
 PURGATORY_LDFLAGS := -nostdlib -z nodefaultlib
 LDFLAGS_purgatory := -r $(PURGATORY_LDFLAGS) -T
 LDFLAGS_purgatory.chk := -e purgatory_start $(PURGATORY_LDFLAGS)
+# Purgatory doesn't export symbols, so disable symbol versioning.
+$(obj)/purgatory: skip_gendwarfksyms = 1
 $(obj)/purgatory: $(obj)/purgatory.lds $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 993708d11874..cfb4b57ff617 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -309,11 +309,11 @@ getasmexports =								\
      $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
 
 ifdef CONFIG_GENDWARFKSYMS
-cmd_gensymtypes_S =							\
+cmd_gensymtypes_S = $(if $(skip_gendwarfksyms),,			\
 	$(getasmexports) |						\
 	$(CC) $(c_flags) -c -o $(@:.o=.gendwarfksyms.o) -xc -;		\
 	$(call getexportsymbols,\1) |					\
-	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o)
+	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o))
 else
 cmd_gensymtypes_S =							\
 	$(getasmexports) |						\
