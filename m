Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2002C82
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 16:20:40 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id v22so14798717qtx.8
        for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PXmP0iEL7NoEd9T/QMFkDnPKk7SG43uZ/gjP8ig4g0I=;
        b=fYYCn5WqajmgSpCS+i0bFFrEDuaLC/vYuvzDB9cWr2onNeQ4H40cDI2419e14yCNaG
         UUX43NJ3l/51FEp5vYOZxQ1GUdY4fsx2pXkpxFm/vJOAI7w7pOijTJlDhyh788djfUhx
         99MIpBSyyUiQUSoyd5o9o5GWC8G9WDt2GH/SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PXmP0iEL7NoEd9T/QMFkDnPKk7SG43uZ/gjP8ig4g0I=;
        b=wVgxN55rGETHhlalbIylpVpPpHKoBX2rxNoD29a6Suyp6o8dzLHOB611nZMIXfE+y9
         i7il42VtHMk9QttL1S5oBIlUhwzOza+1dizEvp8ahm8Y3J98GKa5pouuOTUSbZrePlC8
         TwkmCjBGMzH1T7U7E3fQhhqHoc7OrF74lG0/0S3BmQhT8dKJDIvKS7rZbPix+vTlUlki
         76ZLsNA+vhuXhfKSlFV46FPsnvigQWsnNTzxabK8ix8Zg3Ny+z/IoPgw8mqgnslnRhXD
         1Md3MoRi1YT8h9kC7/et0qwuyjNqQzuuvxqtvj0LYQPpN1hL4JvVa4eIppKF9B/TwFIc
         3Ong==
X-Gm-Message-State: AOAM531NAdOu34SYuDgdxuM96t0L/DFiBSf/pk16FUXnIghrghu9nQIo
	K5g31u0zazuepHr41AyddcZVG++SGmw9HOJoHDWP8g==
X-Google-Smtp-Source: ABdhPJwueNRwd+7G2C49ZaZME9umYA5Wo/JEEnMIP9kE0dbhmQK6GrZ8S0pNOF0D+GLdi4RHsXBu7Bj2RjYtM2z77lg=
X-Received: by 2002:ac8:615c:: with SMTP id d28mr8467623qtm.103.1637079639076;
 Tue, 16 Nov 2021 08:20:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1636961881-17824-2-git-send-email-michael.chan@broadcom.com>
 <202111160027.hFgVPM0z-lkp@intel.com> <20211116063943.7aa27c7e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211116063943.7aa27c7e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 16 Nov 2021 08:20:27 -0800
Message-ID: <CACKFLin4PGrs5yrUc+gqfZc5E9nTskcApg2GA5xYWA7OOzYDyA@mail.gmail.com>
Subject: Re: [PATCH net 1/3] bnxt_en: extend RTNL to VF check in devlink driver_reinit
To: Jakub Kicinski <kuba@kernel.org>
Cc: kernel test robot <lkp@intel.com>, davem@davemloft.net, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, netdev@vger.kernel.org, edwin.peer@broadcom.com, 
	gospo@broadcom.com, Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 6:39 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 16 Nov 2021 00:30:34 +0800 kernel test robot wrote:
> > >> drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c:445:48: error: no member named 'sriov_cfg' in 'struct bnxt'
> >                    if (BNXT_PF(bp) && (bp->pf.active_vfs || bp->sriov_cfg)) {
> >                                                             ~~  ^
>
> Hi Michael, is this a false positive? Is the fix coming?

It's a real error when CONFIG_BNXT_SRIOV is not enabled.  I'll send
the fix later today.  Thanks.
