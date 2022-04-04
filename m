Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BC3200
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 19:51:31 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id bg10so22254122ejb.4
        for <llvm@lists.linux.dev>; Mon, 04 Apr 2022 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lFAH71l5hLiHoLrZZzcQ02KILOzB/xZrhEV5P4Wdld0=;
        b=Qtgc6aj81PF27HwqIjmLraR6kbD2g1Edk4JH8jLfIYET3iNb8qoEFoYXBH7BjQQ4GM
         8tI8gHZon9drp8BlL8xeRuAcE5a116BvXuPVakbHx/K7tjVwbPt2Iv0EgfnkErFL7ZKb
         GNPkfF0lafnWM+sKawmBrReiH9Tf1xoDFXKhOshkxy3PvO+49x7jxaf+NtrpcqbqDN0u
         HF9O5wopaviUM8YsGqJWOON5RVGwN4Hc+4xtI+iR3JwhkL3kDBu86Vv5xOpzCU2D+Oi6
         xN8IfSCARpRBNSNax9wqlfP4rVBgL6u1JtzjiRUMQAoOcFfi1RpuPbk7nXbPj+R2zLB6
         Z+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lFAH71l5hLiHoLrZZzcQ02KILOzB/xZrhEV5P4Wdld0=;
        b=l7WjK4nnrJlea4NpomwullB7zDTL/3KArwtVh6nyJMcEbbf6tKs7LJUjdlHbrDP+be
         4mnJtXlCueB2kofTeAVDXgFSRtOgHXJQkmYvxqbyRHZdxtZudWOEJ539JKR+CQpjPVug
         sTqi5jSWQ/Y4Q9aeOtvRNr+ZYYXzIgesvDhxoWBWPcGPwXQkxwvyXhVtZTo/jaVnhTGW
         bNrLC+bQRlfGln2XzZdfCwqODsKuG4ALIu6FpXs0QmOYWPlWeLCBfAkJnnOPIbkmTSU5
         w4uJCzo1O50imeMnbxvMW1LHPG7GvNy0NNdKitf6h6ECyvSN/yNr9ShbKiYnvIaS8iBA
         grcA==
X-Gm-Message-State: AOAM5325mHxnGFPon0M98tYPN+NnUsfnyPibDEQbeaGAa6hxvvhjUXl8
	wMOfmrINAC4mBMU4UR1CSO01UXYNoSgSXUQYqShH
X-Google-Smtp-Source: ABdhPJzZaJUJ9iytdCtow0Lr48mbggrWmuIS5YY0v6kb4vhoY/DawljwRSvPi9PvR8qF8W/yV7rYMKSCXNkibAXEfJE=
X-Received: by 2002:a17:907:216f:b0:6ce:d85f:35cf with SMTP id
 rl15-20020a170907216f00b006ced85f35cfmr1720054ejb.517.1649101889842; Mon, 04
 Apr 2022 12:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Apr 2022 15:51:19 -0400
Message-ID: <CAHC9VhT2fgrZ5Kcv=-xizUnv0kpr0x+v827YsHYGfos88LjkcQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] selinux: Remove redundant assignments
To: michalorzel.eng@gmail.com
Cc: Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"

For some reason this patch never hit my inbox, despite all the other
patches in this series arriving ... who knows ... ?

Regardless, it looks good to me so I've just merged it into
selinux/next, thanks!

-- 
paul-moore.com
