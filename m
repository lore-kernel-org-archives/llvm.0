Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29381CBE83;
	Fri,  6 Sep 2024 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725637629; cv=none; b=ZNYrkN0hylmAiAWYPDRFiulXs/iAkWnQlMr0oSt3hQ43veqV/ZRAHS7vQxZPAlCstdITKiQaphm0CWwLQBefyXe3xjzQc6R0wxCfrZa9zApj0hLldFCnD8Np6YQbGzqGi/QjjAR2ruZGIxhRIcixv4MIMnbDcIvZ0oRWMRXWqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725637629; c=relaxed/simple;
	bh=gu20GtAI+AjtMwQyNX0gTbxgQ17/cmjuVAn+9Ihywbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z78qDLfhWccFc/dFE03IKtw8Ik45nYEA04Njx/NpZgW0RBJQsbSOkrjpQMObRnYPD2rqeAMHtACso8Ab6RTuRZj07e9GrGStrMR6ynoq4VMt7ygHDOnmLo2zok8tKDpwdSEVu3D4qJOdMqsMY1P8cqRCBVXOqDBGNVVpDdFeqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYRktac9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYRktac9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f025b94e07so19559291fa.0;
        Fri, 06 Sep 2024 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725637626; x=1726242426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh009DPJvSFVva+/nxDK2xUzYWcU9eTQCK+MUuJaT7Y=;
        b=cYRktac9PngTDHd/3YcSQR1N53ZgAShjUlsAZTSTu2eip0AZgCr8neiQFyghOnTdz+
         qdiv/qTv8h5VeXgBVidmwFGxgIjrK9kO9IaWCvpb0y1SbU8XPcgAdQOzajnfat0w5hFm
         WaUvQH3FnotBmM0gX2epjSB70D+AyHi2R5j6PAhBbhl4Z7LsUbVV9s9MecfplRv30AuV
         pfhmmk8yFnyh2EHzni82zv23cOqdLTU49/2eaXmhPrCPJcp8nZO3ieIi5ogZOe+xDH3r
         hVoacHNC+ydwu4yQ2dvNiwLZGiBsZQnPmGyXOw3JMnanNn233YkPDK4CskhGW/3M/cQM
         /rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725637626; x=1726242426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh009DPJvSFVva+/nxDK2xUzYWcU9eTQCK+MUuJaT7Y=;
        b=iWcYn3GNBZjNMG6bW8ZOJObH1y3jAzFXpsyo93Cjsyf3dxgy1+41qjhdBRaC+FQMUs
         LNtAiEYw0COwFhHMDPtyQ8llXABTK0CrpLXKp4ct2QBWTBqcs58teGV4WRBc8ix9A9Yx
         tDmRZM1DneJBtvCjgO6e6hayj7SSZIW4sWCwA25Rvchh8PmNl8ll0SATUp60lMfpbZd5
         xCr4PeNDd9FDtyehGXHkjSfqeUnNAM3+okwZu1jgm5dryrStbZO62ECUxshaA7Dgu1P8
         iaFXuln2NIx3uMwqX6n7O3DwPpLntvgJb+fdauF/L23xatRJMv6rYNCwrBE4f8PO1UFK
         4s8A==
X-Forwarded-Encrypted: i=1; AJvYcCWFX5QrEXsV9GwZcj0BDB743yRsPKExrkWSQTWBZB6d//4ZTa9lCAH21SVbcRL2FbbU3uzhOgQ7RqnmqS064A==@lists.linux.dev, AJvYcCWukLDXSf7vv6IFq+PsGXPbhL5OhV51POGn8hLoxYaygMshQkZO9kLHkq46ePDXvNSKTn91@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+cH4RkMzNDieTbtnYkadfJ9+4BlyJhVcWvrbHFSxPig5+ak7s
	x3uO2jmGAOsmsREXmYmtYOcPXqERYh3Y/r+SpdB6sThKThc1mdCThQzNR9urGGs6MaDTkJiWnPk
	T17YPR/jRebpE4NDOodeztiVqqaw=
X-Google-Smtp-Source: AGHT+IFVTTO8+ZBCXPaEE36sFeuTpJhoQDkWbuaTISaCNmzvdon+aj6I6+n1c5eaD8ERcgKm6xZ5omk4rnvtxUz71rA=
X-Received: by 2002:a2e:4c02:0:b0:2f6:4aed:9973 with SMTP id
 38308e7fff4ca-2f7524a3509mr18052481fa.44.1725637625018; Fri, 06 Sep 2024
 08:47:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905122020.872466-18-ubizjak@gmail.com> <202409062123.F3r9hB9z-lkp@intel.com>
In-Reply-To: <202409062123.F3r9hB9z-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 6 Sep 2024 17:46:51 +0200
Message-ID: <CAFULd4Yz=C5oZ=hWa9biLsXvvBK3EqjndD8kRRWgb=RYiSFKAw@mail.gmail.com>
Subject: Re: [PATCH 17/18] random: Do not include <linux/prandom.h>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:22=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Uros,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> [also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.11-r=
c6 next-20240906]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-ka=
slr-Include-linux-prandom-h-instead-of-linux-random-h/20240905-202710
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> patch link:    https://lore.kernel.org/r/20240905122020.872466-18-ubizjak=
%40gmail.com
> patch subject: [PATCH 17/18] random: Do not include <linux/prandom.h>
> config: um-randconfig-002-20240906 (https://download.01.org/0day-ci/archi=
ve/20240906/202409062123.F3r9hB9z-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 0=
5f5a91d00b02f4369f46d076411c700755ae041)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240906/202409062123.F3r9hB9z-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409062123.F3r9hB9z-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from crypto/testmgr.c:27:

Ah, here we have a negative config flag, enabled for allyesconfig, so
- the source is disabled with allyesconfig.

#ifdef CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
...
#endif

Patch is as simple as:

--cut here--
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..eeb7edd99a93 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -23,7 +23,7 @@
#include <linux/fips.h>
#include <linux/module.h>
#include <linux/once.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
#include <linux/scatterlist.h>
#include <linux/slab.h>
#include <linux/string.h>
--cut here--

Will add the patch to v2 series.

Thanks to the kernel test robot,
Uros.
