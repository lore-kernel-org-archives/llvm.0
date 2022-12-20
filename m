Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510151878
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 16:46:58 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 82so8748904pgc.0
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9MYeEEvKypc4mpQnza4+BeXfUFl1039ZqekhzchkzA=;
        b=gC92C0srqh0bzt3sZl8p90ERaBFv3q+IPEHBDqiAr8Gl6w7ssHuuRnrkIo//rjBc0+
         NMz5S9Q6XtOZi3FBx0E4TRU7spQ80ylSiU/NxJnUr/h377BcLdzO84mLlTUDTWoU/hU5
         H5dlKsnn5YiA+baudcN6twCWz2MT+yKYBKya4HsSRisHj0AI9Km4laR1jl1d96uWv4hi
         +u/Rw/vtvudGmC3fXdcTMh2BVpVP6r6DGm4X+w9i+NmCdlo/MvWp/aC+XJw8m4uKIlR7
         p5DY7y+Qy2vvXMyM3VzWeYwuraPTqOaX25iKSnMpYOl4l1BQup2SR/jySluyKyi+45pk
         cLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9MYeEEvKypc4mpQnza4+BeXfUFl1039ZqekhzchkzA=;
        b=13EpjUXVFXO0K4dfK3j2NrceVz3mrgX3FwtZ8FSH89NfbWOPqJQgDxiWqFVbSxW+7w
         tpVllL9bfe8sVkD1/a5j4PuZeWW1aG9xeSW1Ojg03okfatNX/+FjkD7pi0LQDb3cGfGQ
         ypFrk4s2aoJxFrVIA1bvqg03MjVgPNkE3KJuPiqyQEZ+pxEqzX7GDNMHrkNF/3pB4g1k
         uasIKYqiZgiHVVonqym9yAQcIUSi38FGAhvspid5zz91soEjYOqwfVFqjAgK3p1Y3VMO
         7C4/k3/ralNCHLY0zWXlOQZt/LAuQlutbhSoLiTTAHE+kBXPiXcWjoxNklGDrUN99Ajo
         kG0w==
X-Gm-Message-State: ANoB5pnSngYc7XuPHnEXm6W4Gievw6LsLCv/hgzpYUdkPlVsYQXtuVzu
	rtRnLOX9h9+S0NSPC/PNz5c4ZT9YT1fmJh2X5fLmFA==
X-Google-Smtp-Source: AA0mqf4Ey+s+5l8jI3qYvVeBn8nM7I7QUh+8bTEBMtc1ra/8US8uJ2wgBMg7DP97/O+NPnVsIALqABdGhJE1Hd+5H6I=
X-Received: by 2002:a63:2226:0:b0:478:54e2:ecb1 with SMTP id
 i38-20020a632226000000b0047854e2ecb1mr39520530pgi.550.1671554817603; Tue, 20
 Dec 2022 08:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219083511.73205-1-alvaro.karsz@solid-run.com>
 <20221219083511.73205-4-alvaro.karsz@solid-run.com> <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
In-Reply-To: <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 20 Dec 2022 18:46:20 +0200
Message-ID: <CAJs=3_B7WoERAiXPyvz=6d7O5rcwXMfWZJFsi_ds-OAemvfcgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3 v6] virtio: vdpa: new SolidNET DPU driver.
To: Nathan Chancellor <nathan@kernel.org>
Cc: virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org, 
	bhelgaas@google.com, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

> This does not appear to be a false positive but what was the intent
> here? Should the local name variables increase their length or should
> the buffer length be reduced?

You're right, the local name variables and snprintf argument don't match.
Thanks for noticing.
I think that we should increase the name variables  to be
SNET_NAME_SIZE bytes long.

How should I proceed from here?
Should I create a new version for this patch, or should I fix it in a
follow up patch?

Thanks,
Alvaro
