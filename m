Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339515F40D
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720705836; cv=none; b=SWAz0qEfBQaY7+73wrIkqXxi/cWjG8fwJrpGLvNCsomQL61yTT3yd3ZmMs0eLs93nIb2D7XycL20lKrcTHszCjpY+rN6Knlzgp6ezmOO8sECaYpl6HVOivXpOh0lpLT8cRO8UeGCHWJ3eE2IIUcJov1ZpzhvVAh8h73h3l+yMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720705836; c=relaxed/simple;
	bh=se61FPZzUA5HwQEvtVy2/8LlK6ztmeHr/a3V6wHR1ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7JVcJiKkqIJA1JKWwbFuuXhvxKs0qlSK9hR+Oni6ufN9c1CM4vfwLyjqZKecOb2yPjkBo9yt8FFdpE7jIsM30tvw/UyarS04yAoSjgDRRDdMQEugD/jw0r/3lZO0RsdPsBz5oQHSooAgpQFwbWWP7WzcC87sY1MknPOWNGj3J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OEsQgmMF; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OEsQgmMF"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e0354459844so901062276.3
        for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1720705833; x=1721310633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywdrhTjQNxm59oHEeOA1QDJuGdM3/Aym7bJC9qh8zJA=;
        b=OEsQgmMFDrjQ+ddEiI6c27VihmadErHxXE6Zh8p8sb2zPD6G8naKBu/+ipkyqjAwBW
         nHX8lv0lS19VSp/6wAbiKU0nscF4/Bbkj7yFAUnpokzpH+w0FcKoI93eBui/ORcESYkk
         BSUiOSxzk6lUV5qKiSdEsR6HDND7RR2+E7zmob9TCvrOzaVDSO/GlZyEzRcidyUQaShu
         hCJIur4872OsLljZc5nHFcvXk3Z9IpXMfKZkzWsxXUM4qTXmDTWY+kdSnrFymgk7EMbQ
         4NhjDEJi6lAS4T+GVybio519dWZlPcWdrG1/gyWefyBl3Xi2HmMfL27R9KqmSbcjqX5c
         SLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720705833; x=1721310633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywdrhTjQNxm59oHEeOA1QDJuGdM3/Aym7bJC9qh8zJA=;
        b=l8+IgpetlCXmUa9JtBvX7H+Wtdnq5V8VYbi39bRHJ2IXo7a0Wnf7283pN65VtCXf78
         KarZBXfe+O4DuhRmTJhrbqWsqV3msKRmKOhz4AIaA8eqztYV/prSfj72rEqW4DUCN4/Q
         geQdyXCeOw8Wga3ztbnREkOz8rTxVn7ky0fVqp8eua0s4GVmAaQgTun19eDGDe12tTao
         3XO937RYQar5EktF2bqpaUSxgH48zqA15/c9qrMgJ3XJ64QV7/YUWH++1dgSAAUW9KFA
         rI38DAC/iRC8uPQ1AGal5k9T1Y4lJ3nGNMoqoVeQEccTkMZSQ95eo1g0wetkekzE69WO
         nqSw==
X-Gm-Message-State: AOJu0Ywpbhn4PFg2J5xxuUj4xpFTNPr30Dr7L8XM5dkR4Q9+yjfVi5Xq
	oUtYjYgnEBJcz9bFfZWsRpXVL5QRR048n1JWSnp9H+hHVcjx/naDs+egu0G1jf6msGudGCmR6x2
	tDUHr+ee3VTTTptjQBCtSWNypn2hws129iHEM
X-Google-Smtp-Source: AGHT+IHaoYKq/YKmu2Z/szFpe1/WajGQX2D4bEfURKfajhpytclcvlib7RUfZXi4aqzgVDS/tAm9oTE4sjjzndcULwY=
X-Received: by 2002:a25:5f11:0:b0:e03:64c1:2b0c with SMTP id
 3f1490d57ef6-e041af3b488mr9807730276.0.1720705833125; Thu, 11 Jul 2024
 06:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407111803.LoTE3SJX-lkp@intel.com>
In-Reply-To: <202407111803.LoTE3SJX-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 11 Jul 2024 09:50:22 -0400
Message-ID: <CAHC9VhT8o--Xwj-0TwBwa-n09qbQJzaYruCVyPtqdY_pw49hWw@mail.gmail.com>
Subject: Re: [robertosassu:inode-free-security 1/1] include/linux/lsm_hook_defs.h:117:1:
 warning: omitting the parameter name in a function definition is a C23 extension
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 6:18=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/robertosassu/linux inode-free-security
> head:   804df4ecdaed5aab1b4ba876acd207195090d9cb
> commit: 804df4ecdaed5aab1b4ba876acd207195090d9cb [1/1] lsm: add the inode=
_free_security_rcu() LSM implementation hook
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20240711/=
202407111803.LoTE3SJX-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a=
0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240711/202407111803.LoTE3SJX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407111803.LoTE3SJX-lkp=
@intel.com/

FWIW, I caught this when renaming the parameter based on other
feedback on the RFC patch; it will be corrected when I post the next
revision.

--=20
paul-moore.com
