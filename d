Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA77C
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 11:58:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w27so11273484edl.7
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=QeljF/Na6SH6U2d2T2ly9opDwGxf2t5L8UvVHuUp4co=;
        b=FCPPv4ZMkbzsyYtpY7HWp64Xi09rLXkLRZNF+dZr2T/kWqUDig9iNu+MBmzF3Cmicj
         5Nj9+7Zf42QwpjZleJegr8jm+zq52f4eC1FNcd/+RHjyp3yvmgji7ep8mZN2ZPec96vw
         MeGj+cogWYaKlXB5QDPcGPDdRwlGo7Sb+kkSO8Dz6ZEyaGb0npgcQF2P9JlVEBp41wBh
         DnXehe9Qts6L6/rzba7GCFrAz3kHO9MiU2dweQcGYqCEvWYa+Bnp8EKU/+cm1U1bgfV9
         4jSUQOeK3sCMr/GnjMzXq4Rapdiw4paIw9sTteV+BcqpVCdVzbERBi2uTxldhK9U1Usb
         yeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QeljF/Na6SH6U2d2T2ly9opDwGxf2t5L8UvVHuUp4co=;
        b=TlR/L14yz7ydm3C8mAKBvpV6xPUGVC2A2SGWVIOGL2Zgd/I4pLJBZlTkTcDqBQngYA
         22HOhGwPIFRPmmFexk8vVajGbjhmGT0iFe3dwSRU/HfrcOUzAw/MASqEU+OUWP8dX9Nu
         cTy0IYEaa0JGDgQjBgm84bhxlQihKjfDUUx1QRh7sl873MjtzRcMt8OWWc7Hh2Fn4huP
         AC3DBe9hGz6Cz6PMtqRBMcOlDeEJJ7gTi1Rqeo6RMaPNTj3vYGFOrMzgtaeCibnyMqp9
         CMoQyJA/ffKDiUZ5F7MwTci6bOWC2CGS2+bz2ot5TVLZ1H/a4xat1qBlCo0BdJWd/lSN
         SJWQ==
X-Gm-Message-State: AJIora9oSx2yUUH9NrNJjANZ5NWmvwsJtz+K9pTkMYt9A0OOvaPny6Pm
	ueNPae8eOZrHcGc21DamwLqgNt6oH9WH8hswnSmAaFR6Z6b8o+uU5D0=
X-Google-Smtp-Source: AGRyM1uYrY2ESDEaBI3KRAExGkXO8ccX7fGsksEAM+72PF7EgEF/kFu9562DGyzguK73a/yCu3oVYOnpDsRwsVN09SE=
X-Received: by 2002:a05:6402:400a:b0:42d:f76a:78a2 with SMTP id
 d10-20020a056402400a00b0042df76a78a2mr5543609eda.247.1655207917108; Tue, 14
 Jun 2022 04:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Qingwei Xu <xqw.kernel@gmail.com>
Date: Tue, 14 Jun 2022 19:58:25 +0800
Message-ID: <CAFRajNZf-1xbtLD6tGdQ=rxzNBHaqWv8veo6_mFBfEi5u8b4Rg@mail.gmail.com>
Subject: 
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

subscribe llvm xqw.kernel@gmail.com
