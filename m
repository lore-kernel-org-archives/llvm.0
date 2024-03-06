Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16C5CDE8;
	Wed,  6 Mar 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709712030; cv=none; b=H+3uWRFO8hW6likVin8P2kaTvLkng9zEEkKUe/b3xCxP2F7zUkiOdx9aRdbxF7I39tprc2PDjdhr4foPY/G+ggalJ/V3FeMG15TYQl1z8C1IK18B4HceXbFa7K4X/w+pgvtCM6Xu5vxOKiYXfB7kIUVR0VRMS3Sd3K4A1FuPaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709712030; c=relaxed/simple;
	bh=P8YwVMpnErwixhUR1Mbw5c5QEH9e2xTfI7Qrxmz/VcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOCGPcC5gLE++yRIlwD1BT6twh5wwqxR0W2a8jhxdsMKMJbopC/p4yKtSDK9TP/0ClFFOOjRmxr7WrCknCJig4+3kxCoqQWOeWIddbq/vIKx+nR1uLCIyrII78GZ0+ocq4R2s16y9nmuof0/kxEn39WQXgzdCvQSjWX+4nJhZ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609408d4b31so65611287b3.0;
        Wed, 06 Mar 2024 00:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709712027; x=1710316827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIq8A3I+hnCbTkrRhH0vKNCZiun3rTR9oQdT+6QQC+0=;
        b=BmuWkKJFfVBat/xWgtxOyysrgsw1+R3BlEvQnezDmA79VaWqhiQuDv9hCULvgUxpnW
         lKB73TCLkrwttnem8fp14+xqGXtuUSMavI3HkpNhwLkH192D7pHDaD9p5wuP3QebLu5L
         brBaWboElZKvSE0ZGO17ssWp4ehdrStqz1ShKBXYeQ4moprsjXBKIfLrRb8qMJ+HS8K+
         NvpCcMw5PtZKNmBd0fHOsVP5/fc003PkQrYDhAAKcZ7GSOF3dD4bAndKmdWAJP/1niyY
         R/33+/CmSfrlauHcLCOlAiqlZrvvEynmosdO/O2OEh6FIpOdKUKTJMAC8ArmMk0152V2
         2RBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIYnYTscLqPRhfPmQBxYVxNz21aGLWS+t7ISPMkiUODORqJgYtTQ0+J6ZVJ95PsMAutM5VoqH75QqfaaChXQZzZE7aRjEBwXSWGg18PsLJi8/DSfv8z59SSDy4Lk87PaDwJG4=
X-Gm-Message-State: AOJu0Yy55UKUpBpLJTOgFg9v/+ykPkQf1kApDoCH0ygDcR9rivyuffR6
	j/WpAtOtQhObnq/hvzZVfvtiAQ8a9JPJCtJ5w6dsu0Sh7sklti7klKaifdZUtsM=
X-Google-Smtp-Source: AGHT+IEdFYnPKVa08DJASnaI3KyepwRwy2PlEZsURVBuBNPwv4jTK5LQ5g3eF2TaniMU2+wmZWONig==
X-Received: by 2002:a25:9101:0:b0:dc2:2d75:5fde with SMTP id v1-20020a259101000000b00dc22d755fdemr10617374ybl.29.1709712026609;
        Wed, 06 Mar 2024 00:00:26 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id t33-20020a25f621000000b00dcda90f43d7sm3080152ybd.59.2024.03.06.00.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 00:00:26 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60978e6f9a3so67977687b3.3;
        Wed, 06 Mar 2024 00:00:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvOjDDZQDuLyWyvV7XrxpueM7gmdUBwOWWDIf4k2EaqyJGIUDSqrlJBkUHHqehDU7gWYjdcXS0spzZ60J/VmUP9y0YYg4+ch2lrKL5hqAf8uIy4HC0FKcKY1fqSSjI+gULmfE=
X-Received: by 2002:a81:8494:0:b0:604:9b50:e973 with SMTP id
 u142-20020a818494000000b006049b50e973mr13895375ywf.44.1709712025743; Wed, 06
 Mar 2024 00:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403061131.zzApAwRB-lkp@intel.com>
In-Reply-To: <202403061131.zzApAwRB-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Mar 2024 09:00:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7mAzU=a3wqpsBaE0fo71-_=66X5NSvsLJDTiiZ5_k=A@mail.gmail.com>
Message-ID: <CAMuHMdW7mAzU=a3wqpsBaE0fo71-_=66X5NSvsLJDTiiZ5_k=A@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:master 34/52] drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3:
 error: field designator 'lanes' does not refer to any field in type 'const
 struct qmp_phy_cfg'
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:47=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git master
> head:   0a76003de2b9029d5898c23d23ddbb90f5a74580
> commit: 98177a93f8e405ce41969db23f5bf4766aa6a1f4 [34/52] Merge remote-tra=
cking branch 'phy/next' into renesas-drivers
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
40306/202403061131.zzApAwRB-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
25f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240306/202403061131.zzApAwRB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061131.zzApAwRB-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):

> >> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3: error: field designato=
r 'lanes' does not refer to any field in type 'const struct qmp_phy_cfg'
>     1340 |         .lanes                  =3D 1,
>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~
>    7 warnings and 1 error generated.

Oops, that's a bad merge conflict resolution on my side.
Please ignore.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
