Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2FB67E;
	Wed, 16 Oct 2024 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075258; cv=none; b=BAHwxWJwi2D51jMBGy4HL/t5xRmVqxjzoftq3Ramp8Mqt3qYVHdcmRq4QQKctNxL3llI43125gnNzVRs8JyO7jO51uitBLhlN4z08MQ264GFNdF+IRQGb1ClbSTYCL1Hxf0T2/EL5ceCxXPs7AqrwWJY1+unINl8q7xuignmPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075258; c=relaxed/simple;
	bh=Mll0mPwF2ihobJp02zCEgEgBwbqhStJkbk5l1xAiSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/vnLvv1v0x/XQ2fiZOYhy7mYT5a1tyroNyi9vNXjqcYp2xb5w/Jy5KfvJMFlCw7urX3ThP/YQhuyVrSaJ3EYK2x1+R+ihG+haU3NPvNlSnBN3kmZ6j1Gd2j2YBdIQhQiQKVQQg2f9D8usvAH6libQmRN+KxfgjccdA7HER1ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Be2NH1sE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Be2NH1sE"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b1457ba751so38461385a.3;
        Wed, 16 Oct 2024 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729075256; x=1729680056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2i3NqB8GxXUWyeepDjFITep28fiJMthRR7FM+yUWlU=;
        b=Be2NH1sE9Zb4R6fv1K7TTeisVnsZeygFaSZ4LvHrlEld9+djrKkkMOUrjTyZWm8JGe
         cEcJdaHSJEhF2IYu7VEhaMSIAJoBrFHkrm5pKaVemqc27K3GBXvJ4kCDljblQ1C3hZPv
         qwH58nfGausPbRmCx2gCuRsUo6nZhsBxfleFOVHnLtQd/lX86te/xtHsQB5ovs4RaZEe
         lNWPj9icm36BmAhelzHlAFSrkkb82Yo8F/NbuRT8XtIYNn9rJ3Yow+2JIJUwBl0hTlrm
         hZF+4iky7ciKidlb9FmrHNKn+w8mlEIYsuVOWEnts0YLAP/ytN/MlxxmaeQvRnft0dRV
         aCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729075256; x=1729680056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2i3NqB8GxXUWyeepDjFITep28fiJMthRR7FM+yUWlU=;
        b=GXvxALetmetYrQ2Y4fND/jc7L5siy8+24BhSCNc0LY9kQjgKAuJwr2u33iQ5fDPD0f
         P+/2FaxnAr1WQVoe/KyhIpk7qT+JVsTSUKRiuuH5bDi3rm82VmsYK9qATW3MpDtfp5dp
         xwym5asWThqvK0sQYr/VCiaxqb8L+JE6la1QPCjMJoNMBcrz7FdOD91GlFBoutYKSgL1
         spdy2H7/hAv601f/ZVu7YBw7ArNeF9WQtK5Gh9vDxPlyJtb0QC7vkAkpUTL1vYR90fL0
         K0UBfv7dNXJcf8AVcCTYATAgk3hvMEukTcUAMS/Kd+u3SndHA33U8tBWwGXc8wkUgIEO
         sYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgLw8qG0weGQv0nABcrz59ZoWPRVk2WWk9/APHonqETpoWP5qWqNIseJpeicP/4HjnoPk7sd3HMK20JRf2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw26V8kPbXVcI7XK2k2Qr4AUZXKRRaFyKC45IfZAaEaAZDIOgFd
	8s+6Pg6x3D1Iq9wMPEJaEKVTqioeN4e+Svt3jObtA85HF0ZyTmeDZnywtvog/eRtrr7BYWGt6m/
	nGiq5b5gHW6g+effFF7T725PZIAs=
X-Google-Smtp-Source: AGHT+IGTOksWfLUuL/KlW8e1i77FBbNWUSXq42QyFXKEgMd4+5AZ7TTP1Zc+zXzUawuRmsGyXou5G5XjrdI+fDdUqHI=
X-Received: by 2002:a05:620a:24cb:b0:7b1:3b99:de1b with SMTP id
 af79cd13be357-7b1418a039fmr486277585a.61.1729075255775; Wed, 16 Oct 2024
 03:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410161847.oG293ywD-lkp@intel.com>
In-Reply-To: <202410161847.oG293ywD-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 16 Oct 2024 12:40:44 +0200
Message-ID: <CAOQ4uxhD1QYnZHRekQPm-A+3SFXMzv3vZW6r59kSOFAtXNWHEA@mail.gmail.com>
Subject: Re: [linux-next:master 4258/4954] fs/overlayfs/file.c:234:57:
 warning: omitting the parameter name in a function definition is a C23 extension
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	overlayfs <linux-unionfs@vger.kernel.org>, Christian Brauner <brauner@kernel.org>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
> commit: 291f180e5929ec636ecffd8a0bba00da907e0f89 [4258/4954] fs: pass off=
set and result to backing_file end_write() callback
> config: i386-buildonly-randconfig-001-20241016 (https://download.01.org/0=
day-ci/archive/20241016/202410161847.oG293ywD-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241016/202410161847.oG293ywD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410161847.oG293ywD-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/overlayfs/file.c:234:57: warning: omitting the parameter name in a =
function definition is a C23 extension [-Wc23-extensions]
>      234 | static void ovl_file_end_write(struct file *file, loff_t, ssiz=
e_t)
>          |                                                         ^
>    fs/overlayfs/file.c:234:66: warning: omitting the parameter name in a =
function definition is a C23 extension [-Wc23-extensions]
>      234 | static void ovl_file_end_write(struct file *file, loff_t, ssiz=
e_t)
>          |                                                               =
   ^
>    2 warnings generated.
>
>
> vim +234 fs/overlayfs/file.c
>
>    233
>  > 234  static void ovl_file_end_write(struct file *file, loff_t, ssize_t=
)
>    235  {
>    236          ovl_file_modified(file);
>    237  }
>    238
>

Miklos,

Could you fix that in your branch?
Preferably also the fuse_passthrough_end_write() function in the
first patch, so there is no build warning mid series.

Thanks,
Amir.
