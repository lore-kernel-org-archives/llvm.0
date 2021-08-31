Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D843FC4
	for <llvm@lists.linux.dev>; Tue, 31 Aug 2021 10:46:12 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso22177645ots.5
        for <llvm@lists.linux.dev>; Tue, 31 Aug 2021 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/7V7+7rWRxslepcC696+4LLIXt+f9974ayEMgxKj90=;
        b=f1+eAA8Bbvw1rIg30yw2PdmVyf5r85w0D9NUeAlDymmLxEBoMAlQ13y3IXGQd115DW
         cBm1S4pxH9D6dMlRZyRmQw4M7EwDL+pMVV6nFejpqyEoWaN+3pY+MzjCOb2GCvNT5N/y
         rqi8+OlO8j89JgGZT2I9vO+FqnELe1sz7rUSqsXBc10qvbtKBO6EDPEvLykpqWk7AjAP
         Dd8UNQMSdIAHbH4qQ6QHJFoVED0gpuaR1FAIWDDpla0pjIyFgOVmuv/SNIcqtBl0BCs1
         3b2cLtZltEmjgG4xM1OAN8eXE3ZRciaG2j2EQgJrAopYNowJxbKz0TfyIMQev1jZxjmo
         +9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/7V7+7rWRxslepcC696+4LLIXt+f9974ayEMgxKj90=;
        b=gSYAIolzURb4RdpjiuyHzFVE8W1riGU83+LXh5kHSIOIEEtmA/WWSI0x2vI6DzOGsX
         NTXLlwiz4/iJ2IqWcchKE2tSeHcCLw26mWNbgolH9Z74VA88F/NYTz9Ro9q4cqiNQIAM
         +yN0IKrBuH+gXpKkXYivSu4bnIhZzwPbaxdIXqF62hpko9Mn1emeFnn7l4XeseUwEC23
         AUeWsT+GC2uBHpH2mirN5e+zJaaBKEjWnpTBE8bY0K90MGo34P8WkklBf69GkwU9L7jN
         2FrkEAgblgnVffmv7ucYt3wp+yXw9rpR8KgmI1lR+FN9beiB1x8wCQMom1rQI2sdAwdN
         S1Ng==
X-Gm-Message-State: AOAM533qtNWhI6CDP/6JME7JOrJmLMY8v45YFJJ9ZPPStz9oQiNL30c1
	caFhA69vjRAosvO0p9mYx2J2VQp2knr+uEzTFnsO6Q==
X-Google-Smtp-Source: ABdhPJyu+Z8Xkx3NWpgNa22ldJTrqozVi6Vovf8TudABz9dYWV/rDq5QZYR7OYHQuMz5qke81X/dIh+qVB3Dt5Nw+vk=
X-Received: by 2002:a9d:4104:: with SMTP id o4mr13616099ote.251.1630406771875;
 Tue, 31 Aug 2021 03:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YSzZFgBt6nMvpVgc@osiris> <YS2RrUma2oOSYtIc@Ryzen-9-3900X.localdomain>
 <82161448-2770-158c-fdd3-d253b4ae476f@de.ibm.com> <YS4AufXrOCa4rzN0@osiris>
In-Reply-To: <YS4AufXrOCa4rzN0@osiris>
From: Marco Elver <elver@google.com>
Date: Tue, 31 Aug 2021 12:46:00 +0200
Message-ID: <CANpmjNPp3dAcr+WfYxM6_uQOmFmDf60aL-LbXF12NCzP6P3-6Q@mail.gmail.com>
Subject: Re: [GIT PULL] s390 updates for 5.15 merge window
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, qemu-s390x <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Aug 2021 at 12:13, Heiko Carstens <hca@linux.ibm.com> wrote:
[...]
> I really don't think this is QEMU related. The test fails are sort of
> expected: we've seen KCSAN reports when the kernel boots and wanted to
> fix them later.
> However I have to admit that I wasn't aware of the KCSAN KUNIT tests,
> and wouldn't have sent the s390 KCSAN enablement upstream if I would
> have been aware of failing self tests.
>
> We'll fix them, and I let you know if things are supposed to work.
>
> Thanks a lot for making aware of this!

Note: Set `CONFIG_KCSAN_REPORT_ONCE_IN_MS=100` (or smaller) instead of
the default to make the test complete faster.

The pattern I see from what Nathan reported is that all test cases
that expect race reports don't observe them ("not ok" cases), and all
those where no races are meant to be reported are fine ("ok" cases).
Without actually seeing the log, I'm guessing that no races are
reported at all, which is certainly not working as intended.
