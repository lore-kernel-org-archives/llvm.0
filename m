Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795635164;
	b=hZ0T6a51gY+yAxgKrWKELuvOawm508fb+/YQZWAhByJNbmx2fKoEZ3cQEKciVSgTXTzb
	 7rFXxFbec0PrxVnGb0t4YNdeNSi/GgsF4lqMQAzFMygfZx0yE30zwcsRuRUXXYDxEGQ4W
	 Jlu96Z6kQjZkLbJ8mZjqmXSDh9s5+rU9tbl+tRLIEaR8MaLH7kiqNNF411Ql2IF12wOxU
	 jh8W2esoVu2BLgbURCNuLN0dUPnAnBQx0qFERFj4Exg6JZRTbnM9chUWisrt/BNneB2tp
	 UbnS9s/pojG4L8Brk1TrmTgz1gL+t7OEzVK4IOQy22fl5UHB5Fv70O+AauJn3ua9W0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
	b=Snl67bCX+hs3a/LGDSNdjaaBZ43TUmCOGod8fxvF71PTo9nWNTNNa4eSC5RNAkK50prV
	 jm2z/NN496/7x/pyCN1kYo8Cy7i1TvZvj8lV6Dc+7QY9Sew9knfVxeGPLDmahJPs8G4WF
	 k/DuYBJo+NyTFCRI33GAlUmh3dLWFkkHbfrJ96mi8w0cKdqm/enzozWKSGuf859MG8gHa
	 HqKcmxacdSiZjY1Jfoxw1tuiafGWKQ+LLzDu6E9BkC8e+/7RMTBHZxFxh8fzJeB6OT2cO
	 cmOHKUnknyib1s3Fq83fou0VEGNg0qxHq8mxBp7tsROSK5JeZM9G2qZiSgmpRcbjdKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2+b8fKm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C320606A336
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 19:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C320606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2+b8fKm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492690dd5daso4712090f8f.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 11:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795635163; cv=none;
        d=google.com; s=arc-20260327;
        b=sBy0O85nIDx/Gtz4DmhWXm9FQIgQsEd1NO3IJZn1+4mA3Wl8BxEh3LhNz43WVtAYjJ
         5uxcryqKS99l/5ec7tJIPNUBqOddWvqNlNjvPjCVtu8zDygBK7Fa8n0ja8cbNqLbyZum
         HVTh0w0bnQ+qU2OxN/VT0wWOZPQQewSFdyuQzsASAHiEsTuDCSCDb4RrU94sLH2Hk0bm
         FropW9SapSx4AUZQkU2KIQs1+UQtX05ULelAU1lHN1ZnlCYIP12TrYk4pDCN3MQ1WBcv
         5J+d4TPm/BXUpUQ8vkU2u2lzZyVxZAAcmcJfhY8i5pLmL1bMeQjqNavjlz+dPy2FbIHD
         Kk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        fh=iMnGnwoWJAc8uLQRx2jnaSw4qbJvR/srQNNK3dCnxaY=;
        b=YLPB7JKkWH52agXkhx5MvlXxdRjyyAxsCkXa0CdabAP2CEZTBldCi8KHPu5bPrdjge
         MayFCX1axiAgfd2nuvBlD3Ub4GdGsV/Z+iB/LrEg+Hjx64Ak7NKvqEzbEc51PCm51XE7
         yLH745j+R+OGzGiAgEwVeNs6jseOgZHYTZxJCfytg2eRHab0GYwlkmCPWyS6ZQqfCuW5
         w4FgGwT6DHX1Zevp8DRrVMkqb6dprOBsnwEqqiNAGmz5524qi4UrDrKy5xQhMuhd0cyM
         COpeLdXWhKKwcKDyD/C5Hb2xZKGZOsixubMVEdWvrDByotnnbT/c5LbrnQF8ItDjT2Vo
         vA/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795635163; x=1796239963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        b=S2+b8fKmdRBx/wBTwecUJCBDhnQEQvtlxf7nLrrRPbKyy0254rFOI0mDpbp2KoZsrj
         WqKsDKHHvtka8KX/UeBYw7mhxg2/E1udAMl80XocBhvw1ghTuiwwluDSd+xSOIl/pX+3
         HLCztuKwzqv8w340Kpvw/+VIqTsPr/jXvoOb104pT+UHnzr244PY2u8AOYQQWqeGlfnH
         KO3FqcU4CNEh9nJlodNQuLQZC9KxcqM7nAphIgJIVZN53StMsRiNyXD6L8bZuf+PM6rY
         vBNfyIgovZ+IZilfuTVOcV+gcgccvxw4jtzzRGqt0JBK/Z8kdJfWRJpIGq8bmhap5PYm
         FIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635163; x=1796239963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        b=gzfNVK202s+bx2onQLEuinqwUmtBN5MzhZYsuFkdf73XiQ0Ee3/LZCbihy98fzowd0
         zvXQF2ujpL4dqPDSHnu6G5TRJuruKsQdJ0ECYPZlkCyaiE2tbzmJlt7Wa/tuh1mtdDmU
         /NEgbnvY5hCdYFA0RBBnnm8m3XUcGCDPbTy/V6nJB0qwvJxikZ8FWMjlcC5w670iA3RT
         uk+MdtccEn0fNjrKMYLma4aLvNlbPiMR1/lkGMu8OrvlBfxf8EQCMdDe9OfOFiW0XhLC
         WI0h23jOzCvjS32AVqlVRspUa5w3ZjOXmjlY5ip7WEjgYnlS7bbWEozYegxdmhrFggfc
         Ewrw==
X-Forwarded-Encrypted: i=1; AL+hErFZdwbWOfonPE04Ap1gQD/Ndtbkc+4dOwAEPq46ATSD1EN8sLHmmk2x3+9InOG4+pNHTSRk@lists.linux.dev
X-Gm-Message-State: APuU4Z+PQdeENs5wOykBKJKAEAM3PZZp3GaaFWdf3ovrc7oyBGD41V3a
	PE0o6ydNjDsmHb73G0W5j0Uq7ZPWjtuK/dsV415UgnsY/A7I38Y8OXXuAb8fYbG1zOSsSXf7Jyo
	N1TatAEizNKOqCINMKUZDoM+HsoPEyKrYc/yojoQh
X-Gm-Gg: AZFdTZeEbg2WU83aSTCtRHMBqhPgCzc6ybuCR2nkwwm3DZ22hFEizq5ynPTtsmMkLKl
	wl9/cW+aL3nbYC87STkdkraOIBk5iFY6fm80ASnjh7VecgYWOd28EjG2gd/08BCp6gMedQVrO2e
	GpBGF+c7usxyMuzMmg93//b2bMHcysr6ed3CfACbRyvqKOp3a6+XqYjmC8Rzb+bvo1K2Clxf5vy
	4JR4FqGqT+ulx3idaTIKBVSMqFqeMCGxgPsbqbTTrO4wDgh5dZOknd0IzEwdNEO4qhuQIoQhkqk
	m2dPLIQvdsRb3m/6x3adqlIMWzBf4XIvsGYxgIBAWADva3XH8C9Gn+p5bh+m/1HwovM+IqQ30CL
	2e8aD0DsYT7jdZmrqXx1P8jAS/36w9wzljoKiS5+xW9IzUGBv1HgJItGokYr/pr4b4nNXuR5wLO
	7dGAo12F5aGRE1PDR6x/22PFjgLFHy1er+KN8h/0qZWh09QGrebmYa6WQ4IWXZySU5f1368YLCA
	1OqZO+4aAIO3dvHqYyEWC5a4Sgp4qM9440urw==
X-Received: by 2002:a5d:6f06:0:b0:4a6:8d5b:7338 with SMTP id
 ffacd0b85a97d-4abb3a4d35fmr38121765f8f.37.1795635162216; Wed, 25 Nov 2026
 11:32:42 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-topology-wunsequenced-v3-1-efa3db7e0bf8@kernel.org> <20261125094643.GY2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261125094643.GY2668804@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 11:32:31 -0800
X-Gm-Features: Aa3M54rVQ8eJKNwIoeqgCfcnaPCAwUQ4sJvYenMtBURouDlRSqpiVSf8nOBT24w
Message-ID: <CAKwvOdmyGdn4ES6Ku+Yovd7a5imzmtmYtd7KB=OMCqKpv1X8rg@mail.gmail.com>
Subject: Re: [PATCH v3] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:46=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Nov 25, 2026 at 12:23:35AM -0700, Nathan Chancellor wrote:
> > Clang's warning is ultimately pointing out that jiffies may have two
> > separate values in this initializer because it is volatile and accessed
> > twice and the order of these accesses is not specified. This could
> > result in unexpected or inconsistent behavior depending on the code
> > author's intent and whether they realized the variable was volatile or
> > not.
> >
> > As two separate accesses is not necessary here, add a local variable to
> > hold the value of jiffies before the designated initializer so that a
> > consistent value is used for initializing both members, clearing up the
> > warning.
>
> None of this tells me why we should not just disable that warning and
> get on with life.

Nathan has provided you 3 different ways to do so. (Could also do ugly
pragma's around this code; disable it for this entire source file via
-Wno-unsequenced-volatile in the Makefile, and finally this diagnostic
was forked into a group; it's now -Wunsequenced-volatile under the
-Wunsequenced group, that could go in W=3D1).  Pick one?

I think the warning has value generally across the tree, even if this
particular single instance "isn't a bug, per se."
--=20
Thanks,
~Nick Desaulniers
