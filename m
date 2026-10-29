Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300064;
	b=r61JKiPK21Zuaa7PwyV9Y+wn7AR9ACdRyEojaeofxoaWc3IVsc/iCMniuBxvFb3oZeCA
	 1Qj9QNNG/5rXnjxAt7HlHBS3Xu3SYYHH84eFId04mcwXg5gBWOK850JMlrzwSExeq/S0b
	 lALc74YIW3FjTWap7m66+0Ie9ejCfaSSypjZU7kdlNF0YxM3o4MxwbbEJbT54kEa37VXp
	 4IYMHZKsiaSRGkjELfg/5epkszp5oM4/ju7Ym7pwI9SvUiUQ/daQcMaM6s/aO7n1AbhFL
	 BZvRolVSif9c3riAtLzprO9ldDzx9AGSZDZy18q8jqwD0I63gsTBUgLa070aCq6RbEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
	b=Kj2j0hyVmOfncaPgm6I3I6MNEuVCrydolk913DYpXkncc0hzRMTuoLPNE6U0C3npPFr2
	 VZQampRStfPKZxpfcA5r6otfGjb49eMLnrx8WDQ8pIHxPLQqcFhcfi1ZpWisq28O4qDfh
	 8GAVrq6tx8xOpe9Q593B1yOrVYjmDYYswtreuaWFq237LpUvCOhufaxmhHxdqN0p9/0Vo
	 wy8uciRykepU9TENvS8jEVoYBW35h/8Y35PXvhfYYuQLfaeKvFQuWoQ8CR/coNBWcr+C2
	 7e//vucgVINvzWkAQ7vbpxi3AE8kvOwVLnGD9kvHzqiQ68ZgbBIfoYocM9y5DCYfSvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFtCAtf0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94A606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 18:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE94A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFtCAtf0
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so974468a12.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 11:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300062; cv=none;
        d=google.com; s=arc-20260327;
        b=pIGcdfTYACWo53CnP2b0zqLDbheZE4thgcKQq1ZcTODhlfbz1T8A/9wJ7QJQSjcjJ1
         FXfOP5/GP4GV1sam5k1RazvLnhklCGii13DaDqiDaj3Y9HkA9RjxIrpavmc6BPrrleHL
         ROqCCIGIV4mjkKOjaQRrRSY4VPByFs/kdizqoFOSVQNtH4cL6FpwNN+HTP5gdg0R/7zn
         gMBZcgliIqjMzQZ+H2pXti+9rzSjeaeDN0fIjXB7BGkpsrBAmd5fE05kzznopn5cFC1t
         5qti/V6QIJrhapDvLq/v1i+pKcLbhd6b28345n1JJuS1FqfuALjRPCzxffqJ2PCA2Zkt
         Hr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        fh=jm702Na4l5zpN8CmeUgVBnws3m20w7VytFa9ArF//ug=;
        b=MJJhJp8oZeQgIcPX8yt1bJP4A+1zGTU58wcZ5O9Bkk5AlE/JrQtqSIwZXy+Iq4ykhx
         Lo4e/xWKgUFVZ6fAxIFFF9qYGiPzuNGXQFOvcAKlIYCmL6nNDJU4XPcPZMpeX/1GOJ0v
         CSDZkEii9wDJgqnHKdY5FmZMgtYQ5hb6Mlod5NPqy/N8441TQq2V+4VTCmfcrUsL/baQ
         M3Lbqpenls06HXkzQKwp+krQFfD1Qa5f2dIjMwrONe2J3JigRpXzp/6X0AO9Bc+0F0u7
         bjtWVEsjh6qbPVHL4/CFqeWVStvWEWeymFC2A+E4i1lMd9egj21WmYGyBE5dPNMySKrP
         27yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300062; x=1793904862; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=SFtCAtf0NKVAfK48Z+X1+8Dmzu8QNM+IcTFU2pYyPr7ponI2yHxLo0J3/EM8RSPOz/
         XmAL8k1miSlA+DHEawoiCQq8OTToiHGBCQMy55T9qeSOj4g4tL6jG5MxOd7lpNeuh6ZG
         MQk2WtdodscJCLhZamvUSzs1ys8qtWRVbEPYSRly5eEalW29SAPuRpbnuPfi833JxNhO
         Oz6LSfOrv1xdeCC+OSjl+IuCPMtN+SodmbJqPITYhG+SDpnz8R967uj/3SoUCsvoF/JI
         G4892Xtby/Wgf6+roAG1FgO5dtzO91Lx9RttXdZXJlGIvVaVpTjh89HzMvNG+nHswsZQ
         bXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300062; x=1793904862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=eSK9Bmr+aCQP7tBSCyp1UjmcaPCQj7B83cNvr3Mz/ZRcx4tgdW5tRmKZSyk3QhtakE
         BKgOOyhFJ1/UDQ2ViGdlR3TAP0zDvAABGOta9tymsr9GZAOQ1flSSI1FavEc63CoAZEj
         kFOfIyxb02VpFSZ5NSJ3W+9Zg1jTbfKzxponck49sTHklaOXNk9+6JbhUFyEw7FkocK0
         Vbbf84yDSpxE1FcA5HN+q+O1NCmMLp5J9EvTiZY9orUTOOnSVOoJQegI+tFcNjoVMwgb
         N3+R2/wCyXSD8NceXqsfh+ko46yClj39tFbZFAwcHhgZ257qi/CWziMRKmgeLr3oH8Q4
         yvDw==
X-Forwarded-Encrypted: i=1; AKwUvBy4KKv7a5fRtitN5Q/zWykSN8EOo3m/UjbWL7MXUd23Wtr4VbdpHYcC9GBjU2rt3xQHV/8s@lists.linux.dev
X-Gm-Message-State: AFq9FYK/iqyxsExVpzkh0JElAHwNj5dJnxdaNCqCXTXp0/r9Xrw8o4Fq
	mWWEXe+KAqvcRrHRph7Vssc8ZPG9IsX2khO5cUdKw1USnmYWdAfEWYWGLyACnbccci1V0jZsKMy
	tAoPAdfmOKHL1HAHzolJ9AxDzmWR0k/dyUw==
X-Gm-Gg: AYBFou2OXERYKwwOHj6op1IDUtkhx34hyFvTi1NZ9WeRtzmDPm8N5MiHFoHSCSzjieo
	0guh8WTB08Qif6w8/biGiRffwEoGcSrMLk98EUb0JgteknGnFuWw8UzUvGK23n4Xl1fJDn38BO/
	JbcO9VAOv/rHikNBpYnyn7wwgDXfREDdr71vWFEZzPLsxeqRF/kNKSgEVbJW+IqGGeQmhw+mCky
	CMOU0fuHKnuAZnp+DS8cAXCYbF4hYv+kpW0ZwOcfvUdXARiLYB6/t0MUgyFo/TjiCVokTUCUPSa
	mCB21nkRSXab2mXCbpdjTo0diLxg4nHtN/WPUdDgMWaZ4874sFOS1H4G3LuUMF1Ipku29yk/2s7
	Pdk0UQb07spKOzutqqwmAwsARxsHGPCtWlGI=
X-Received: by 2002:a05:6402:a6c1:10b0:6ac:a862:d8ce with SMTP id
 4fb4d7f45d1cf-6b49cbd6ba0mr3412953a12.7.1793300062077; Thu, 29 Oct 2026
 11:54:22 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202610290223.iOEGeDs2-lkp@intel.com> <20261028202400.GA835963@ax162>
In-Reply-To: <20261028202400.GA835963@ax162>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 29 Oct 2026 19:54:10 +0100
X-Gm-Features: AclHuK-nQVrYwHXIPfeZqhaOMYDdttYG7QvDfwRoqznKlouAeTSr_3BHeahpDrs
Message-ID: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you Nathan for the analysis and suggested fix. I agree your
patch would be useful even if the warning wasn't there, to make the
device probe more robust.

Being a new contributor I'm not quite sure what the process is now -
should I send out a patch with the correction, just as I did for the
initial contribution? Or is it going to be fixed by the maintainers
autonomously? (Obviously adding a Suggested-by tag with the rest of
the bots' tags).

Thank you for your help
-- 
Luca
