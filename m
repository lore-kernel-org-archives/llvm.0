Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF51E2848
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746921400; cv=none; b=jcbWFuhutfEv+rmvOAF8hYLtwBporqMnMwriuHglCVQAlwFnLYzW6/CxV6rQZRjYdCOM1ITaBxQbLFsNu6YkC69h5YV/Ga4X411Qn2cGyRL2lSRP17q0AjXiPDa4729nGYEeSBDS/COzXd+TGX5qYfRhoPEelytjK+ZTiV/DwWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746921400; c=relaxed/simple;
	bh=B6HD8JOgcqbc4Q6nDP93yKKX7/9HuCMtPPnlbsssBHk=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=hdjDls8CqJsnW7cE9+9hS8Zbp2EbiBdUKPFxWjm8YAMWvnQ5jBvxP4z0u99r4c5/qu3kaKXFuteH7IF7rn+FGexwvxb5sbkN2tPRJZifGe9gYUHTKv3++EUmb4PI+dnT5g41iE+94KR7q0TbD0jiys4Ha9uC81n/8JBdCUyyXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNndOHdn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNndOHdn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so2696264f8f.0
        for <llvm@lists.linux.dev>; Sat, 10 May 2025 16:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746921396; x=1747526196; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SG/9sXDV5lAmeLv60QEvJW8kjM+gBVhAxDM2EkRpIg=;
        b=FNndOHdny02M4nk2ePWQkcBCfiYlpwdEtizNEPfWBfvWZ0PdPOAuuji5JirT7DJnv+
         SOey/AJyv9q9SxJSvWPhOq2M39uTlDn4A88s7On8qQP9hyWJe+Oq8bVc/lc2TWgVo6nv
         tM7TKBchTYhMOhSTHLOpS7rsXrtxwfpyQFSiTVT9zugmhk0kLYvQGMjv3a0qXu6qzT78
         xU2LbYPgW4+nQOcoQ9oK79rzBoH0YMxCPoBMTtxOLNk7jgGYXZXeZEKV78sxz7G8nRKK
         alsBQOAU9Voua7I0dL7adhJ/zPIqVTg/LEWRaRYlctpMRoEOmKDzEvpLmajQC/+hFv7F
         Q33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746921396; x=1747526196;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SG/9sXDV5lAmeLv60QEvJW8kjM+gBVhAxDM2EkRpIg=;
        b=F7HYqTRrgOy3R/6YjTYpV/psVzshX7VeDEgA2xqbVQEYgGxqGvSHqy0fPMGq2fcGV5
         LvrXnuvBqmyR+Jp8VZ8JNmeHLePByurVj5SiJih0xxMB32gisVeN/wpfNebEQSyXFl4p
         XLDMoWxISYzgmWh/G+w+4sAemAS7P7DVAC/vavlIpfoSFXMcZaOIX9IVBjl0Vxl7+pl8
         tEenGE430enuBTfmmhWu19AIlOvh9yPnE1sIMFZ8XKs2sEWqgpP+xlEw3H3eByyk30Ee
         BpACTqBXlDJj/PGrWG51rNJSo2UBm5VMdVcY4r6Xuuyzi/+Mj1Vu5/0k7xSBEagiHHrg
         3ViQ==
X-Gm-Message-State: AOJu0YyowUhA9rryo1+prAea2xfiOBlccSUiv4HjSvfh7R2vn0Uo75O4
	Hu2UPypvnzNul9aOPurTHmfxwmIVTCBn3FKkyidDgvX4p5qnJEPn46IccXfW6t0wRCn7XPF+O6v
	d
X-Gm-Gg: ASbGnct4Nph1606y9Q/9ar5go4rQg8PDbYiFYGzNZb4VglLxF+eXng+pG02F7EeK/Q/
	xckR2Q148gZvlsf03AkGXS6ydpqUGZpSdVxUK9v+VBf7aylMTn068f8N9KWb3zeoAMtvClWGF/+
	/PRXllY1iohix+z1Y0r9jyXuIndYzxN7Qlde/4yk1NRJxZE0Pz8IxN71tAZ48vLPnd3yu+ze5Kh
	QfDecLX6CzlAWPDmVyk5HYRw6XKpxblJ/KTPbSgQFQgZchaRZlfItlCCXmpPfaaJraJ9EtfQNIS
	CfBqe4159aIJ3c+XJbaJT9xnqNMyI00oJyK0er4fWeDB78ZStR0xRj4tAcQolEjvqVw1wv13trQ
	QNBZmkbqNAQEU3p1oiKBI210=
X-Google-Smtp-Source: AGHT+IEcmKJ0/tvfMHESmeTZf1LAL3lunKPUNsC6bDZWLNh83t/V9RGNgisDJRh5wi49UVhO86we8w==
X-Received: by 2002:a05:6000:2485:b0:3a0:92a3:24bf with SMTP id ffacd0b85a97d-3a1f646b392mr5909263f8f.30.1746921396567;
        Sat, 10 May 2025 16:56:36 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm7844699f8f.14.2025.05.10.16.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 16:56:35 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 10 May 2025 23:56:34 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <227840968.8588.1746921395918@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-10828-g04364fb888ee: Failure on
 arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8587_337773221.1746921395109"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-lts-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_8587_337773221.1746921395109
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-lts-allyesconfig, after:
  | commit llvmorg-21-init-10828-g04364fb888ee
  | Author: Kees Cook <kees@kernel.org>
  | Date:   Mon May 5 14:30:41 2025 -0700
  | 
  |     [randstruct] Also randomize composite function pointer structs (#138385)
  |     
  |     Check for struct members that are structs filled only with function
  |     pointers by recursively examining it. Since the lamba
  |     IsFunctionPointerOrForwardDecl cannot call itself directly, move it into
  | ... 14 lines of the commit log omitted.

Produces Failure:
  | Results changed to
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 20660
  | # First few build errors in logs:
  | # 00:07:29 arch/arm/mach-bcm/platsmp-brcmstb.c:110:11: error: default initialization of an object of type 'typeof (timeo)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | # 00:07:29 make[3]: *** [scripts/Makefile.build:229: arch/arm/mach-bcm/platsmp-brcmstb.o] Error 1
  | # 00:07:31 make[2]: *** [scripts/Makefile.build:478: arch/arm/mach-bcm] Error 2
  | # 00:07:37 fs/verity/enable.c:204:33: error: default initialization of an object of type 'typeof ((arg->salt_ptr))' (aka 'const unsigned long long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | # 00:07:37 fs/verity/enable.c:213:38: error: default initialization of an object of type 'typeof ((arg->sig_ptr))' (aka 'const unsigned long long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | # 00:07:37 make[4]: *** [scripts/Makefile.build:229: fs/verity/enable.o] Error 1
  | # 00:07:40 ./include/net/ip.h:483:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | # 00:07:40 make[4]: *** [scripts/Makefile.build:229: security/selinux/avc.o] Error 1
  | # 00:07:40 ./include/net/ip.h:483:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | # 00:07:40 ./include/net/ip6_fib.h:271:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
  | 
  | From
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 20661

Used configuration :
 tcwg_kernel/llvm-master-arm-lts-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1679. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-lts-allyesconfig-build/306/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-lts-allyesconfig-build/305/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/04364fb888eea6db9811510607bed4b200bcb082/tcwg_kernel/llvm-master-arm-lts-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/04364fb888eea6db9811510607bed4b200bcb082
------=_Part_8587_337773221.1746921395109--
