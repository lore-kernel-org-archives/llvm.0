Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030B1FB3
	for <llvm@lists.linux.dev>; Wed, 21 Dec 2022 07:05:46 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t2so14687133ply.2
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 23:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Sa/I/7gVZaIQy7B1ZRMHInqzdjhXIObW4yJN5eIb0s=;
        b=O6PraZUESnwbOholnhjgplj9xv51g9sGEVY8NhsjgGTLrtwdyLSpcy0hoDX94TLpOM
         ZLtIi5w3Xaw+kDPdXAKAd4uQybBVnl3NhdP8baIsgh0xxPJfwH316rvbIt08yN+SVFBc
         Em1QxCO/rC8nBxgI+dOUE46YXMb7IexbUy0+CdTSC1EIy+Rv9S3Q5xnA2NxRxIS+klwG
         smbNQkEXEYHiNtF4LRNDHBJ8rnVk0NROrkfDiFiCYNOEm+UYFZ/xMn/WjDCm9Ah2p9ZB
         1vUHjeklLjFEGi/8nFgo7OJpH6ClxYT9lmQPOdmyfvJZ2XywtGy7VcDizXeYQvsoHt4H
         aaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Sa/I/7gVZaIQy7B1ZRMHInqzdjhXIObW4yJN5eIb0s=;
        b=wjYoL/xTsNiCWpUC7cWGXxz1Kp2/LI8yfgxaITjBrM2wR/fURBmYGiEN7AYXN1TMqR
         b6Pz0niY+c0VSc+g2um5IYlw7qGaKxvysGuz92QjTHDczQyPg6moGl7kM1Mlnz013+gQ
         I6VlflqxB0s34gWWbpv9YaDa4anl5/CWdKNYVOKqbGeRMmJy1ES60gLrGo+77FZV4GHf
         RRjN0jIN31euGh4ixk+htuQE1S0WrOi8Son/F0yM2lAMGCM8p5SCZt12Q38eLs4UFfJj
         dbGy7cUxdkEbT6L2kld750lURXQWKVpyMy+58gSGS0BU9oRFCcBfmMn2CYo+97VdrEzC
         P+vw==
X-Gm-Message-State: AFqh2kqB2n5z1o+XRx6RWnJHHQpPJb9ZJbQ6ZAcFpSArZ5suKADU84dU
	gcfWwSW2+sxndv3bDHzVv2/U4ECZgph2lwAlfpKyZg==
X-Google-Smtp-Source: AMrXdXvI2GJq84khAIseirWSINYK4M29Z94nEO5s+eBoaKJPpgioRv51ok/p+Qy7fV6OS5HQxAg+rm39/gGG8ulXdnk=
X-Received: by 2002:a17:90b:8b:b0:219:19c1:1ae7 with SMTP id
 bb11-20020a17090b008b00b0021919c11ae7mr79160pjb.13.1671606345295; Tue, 20 Dec
 2022 23:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219083511.73205-1-alvaro.karsz@solid-run.com>
 <20221219083511.73205-4-alvaro.karsz@solid-run.com> <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
 <CAJs=3_B7WoERAiXPyvz=6d7O5rcwXMfWZJFsi_ds-OAemvfcgQ@mail.gmail.com> <20221221013907-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221221013907-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Wed, 21 Dec 2022 09:05:08 +0200
Message-ID: <CAJs=3_BuiRj2ZGQM7wVfpUgGNMR_24jv3h0fv+swBk54Gmr6uw@mail.gmail.com>
Subject: Re: [PATCH 3/3 v6] virtio: vdpa: new SolidNET DPU driver.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, virtualization@lists.linux-foundation.org, 
	linux-pci@vger.kernel.org, bhelgaas@google.com, 
	Jason Wang <jasowang@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Please post a follow-up ASAP. I can squash myself if I rebase.
>
> Thanks!

Sure, I'll do it now
