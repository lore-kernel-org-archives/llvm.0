Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2515EBA
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 14:51:19 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2774c52c8f2so1683529a91.3
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696431078; x=1697035878; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLVCZmOoFszteTmcZyNnT8oSn2/HZ/GZnPsIMItk4Nc=;
        b=R7qeqnkK4KpQjOHTaZ1dZ9zk5yBS2sNMTEuMngFcJbjWYZVeUkOKw71M4igK+GVzmJ
         id9IbC1T/eXO8RfT+o9Hy7KEzokxwplPX5ZaOjZyHrmjGod+/Oep9Kan8Vl/VLtjrE9o
         qxbn4jB/HtXnP2tJozjzuPToBfRdfOhCjteETFldm6Q+q2KomVNVVNibk7bmazMeDJV2
         LcGOq7dag2F+3ZBElW/fX3OzkbShrV/a3vU5omvXtGV2WpzVNkNuzrRr+tms2SypjzCt
         S3OUqbB04W+K/BdSmyPzP1r+zoUGj1gYEd3UolWnmA9X9Y4jSGkz9uRKOXPLG2d73UFU
         M6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696431078; x=1697035878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLVCZmOoFszteTmcZyNnT8oSn2/HZ/GZnPsIMItk4Nc=;
        b=k0LaP6QiyVtz/Y6Yo2xQKPI+Mjp4Oy4xkhBciZKDebuHZt3UbW2WamlbUOJMpoIgK+
         x+yl6wG9W8z0Ew/qvnhh7grkm77S2vIxm8Spr3lbl8fn9IqsCCoyae5b3gABlrOg8qxl
         RsNIpMYuZF9wD79sbrfYJlgrO0YyZ6oEbz4IYbXHtK5u0qtWpde3OAH7kw0LqSjH+QV5
         NHxqPzqHH2rBzuYemC8vCuUqTVbcBtNZJOGbvUZYBnSlYrMohUv7Cmh06T7g8ASrkv3b
         A/QTxDfSA+wYooBaQx002J7DZrxP7aQTOHJTo7bkLBXuYRy6AzLZdHbGH8bAUualF8C8
         ivQg==
X-Gm-Message-State: AOJu0YwdZbXNqSCAdR/YpawVBo/CAIQe2+NPAayVtGzDGm7wvDgtekWY
	3zMvcPjSqYaC45WqBvm82WYMBSeLbUw=
X-Google-Smtp-Source: AGHT+IGvS1KUy2hRxMCGWxOVEapZjYZkKjI19h/RFt0FJmulgAsNNNkAaIPn9KMBLP4G86kakniGuCrnKWo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e2cf:b0:278:f126:da0f with SMTP id
 fr15-20020a17090ae2cf00b00278f126da0fmr41038pjb.0.1696431078520; Wed, 04 Oct
 2023 07:51:18 -0700 (PDT)
Date: Wed, 4 Oct 2023 07:51:17 -0700
In-Reply-To: <ZR1Yt6Z+dhMbn/FJ@luigi.stachecki.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com> <ZR0QOGo5DftkRWsr@redhat.com>
 <ZR1Yt6Z+dhMbn/FJ@luigi.stachecki.net>
Message-ID: <ZR175enUCh3KkAU6@google.com>
Subject: Re: [PATCH 0/5] KVM: x86: Fix breakage in KVM_SET_XSAVE's ABI
From: Sean Christopherson <seanjc@google.com>
To: Tyler Stachecki <stachecki.tyler@gmail.com>
Cc: Leonardo Bras <leobras@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 04, 2023, Tyler Stachecki wrote:
> On Wed, Oct 04, 2023 at 04:11:52AM -0300, Leonardo Bras wrote:
> > So this patch is supposed to fix migration of VM from a host with
> > pre-ad856280ddea (OLD) kernel to a host with ad856280ddea + your set(NEW).
> > Right?
> > 
> > Let's get the scenario here, where all machines are the same:
> > 1 - VM created on OLD kernel with a host-supported xfeature F, which is not
> >     guest supported.
> > 2 - VM is migrated to a NEW kernel/host, and KVM_SET_XSAVE xfeature F.
> > 3 - VM will be migrated to another host, qemu requests KVM_GET_XSAVE, which
> >     returns only guest-supported xfeatures, and this is passed to next host
> > 4 - VM will be started on 3rd host with guest-supported xfeatures, meaning
> >     xfeature F is filtered-out, which is not good, because the VM will have
> >     less features compared to boot.

No, the VM will not have less features, because KVM_SET_XSAVE loads *data*, not
features.  On a host that supports xfeature F, the VM is running with garbage data
no matter what, which is perfectly fine because from the guest's perspective, that
xfeature and its associated data do not exist.

And in all likelihood, unless QEMU is doing something bizarre, the data that is
loaded via KVM_SET_XSAVE will be the exact same data that is already present in
the guest FPU state, as both with be in the init state.

On top of that, the data that is loaded via KVM_SET_XSAVE may not actually be
loaded into hardware, i.e. may never be exposed to the guest.  E.g. IIRC, the
original issues was with PKRU.  If PKU is supported by the host, but not exposed
to the guest, KVM will run the guest with the *host's* PKRU value.

> This is what I was (trying) to convey earlier...
> 
> See Sean's response here:
> https://lore.kernel.org/all/ZRMHY83W%2FVPjYyhy@google.com/
> 
> I'll copy the pertinent part of his very detailed response inline:
> > KVM *must* "trim" features when servicing KVM_GET_SAVE{2}, because that's been
> > KVM's ABI for a very long time, and userspace absolutely relies on that
> > functionality to ensure that a VM can be migrated within a pool of heterogenous
> > systems so long as the features that are *exposed* to the guest are supported
> > on all platforms.
> 
> My 2 cents: as an outsider with less familiarity of the KVM code, it is hard
> to understand the contract here with the guest/userspace. It seems there is a
> fundamental question of whether or not "superfluous" features, those being
> host-supported features which extend that which the guest is actually capable
> of, can be removed between the time that the guest boots and when it
> terminates, through however many live-migrations that may be.

KVM's ABI has no formal notion of guest boot=>shutdown or live migration.  The
myriad KVM_GET_* APIs allow taking a snapshot of guest state, and the KVM_SET_*
APIs allow loading a snapshot of guest state.  Live migration is probably the most
common use of those APIs, but there are other use cases.

That matters because KVM's contract with userspace for KVM_SET_XSAVE (or any other
state save/load ioctl()) doesn't have a holistic view of the guest, e.g. KVM can't
know that userspace is live migrating a VM, and that userspace's attempt to load
data for an unsupported xfeature is ok because the xfeature isn't exposed to the
guest.

In other words, at the time of KVM_SET_XSAVE, KVM has no way of knowing that an
xfeature is superfluous.  Normally, that's a complete non-issue because there is
no superfluous xfeature data, as KVM's contract for KVM_GET_SAVE{2} is that only
necessary data is saved in the snapshot.

Unfortunately, the original bug that led to this mess broke the contract for
KVM_GET_XSAVE{2}, and I don't see a safe way to workaround that bug in KVM without
an opt-in from userspace.

> Ultimately, this problem is not really fixable if said features cannot be
> removed.

It's not about removing features.  The change you're asking for is to have KVM
*silently* drop data.  Aside from the fact that such a change would break KVM's
ABI, silently ignoring data that userspace has explicitly requested be loaded for
a vCPU is incredibly dangerous.

E.g. a not too far fetched scenario would be:

   1. xfeature X is supported on Host A and exposed to a guest 
   2. Host B is upgraded to a new kernel that has a bug that causes the kernel
      to disable support for X, even though X is supported in hardware
   3. The guest is live migrated from Host A to Host B

At step #3, what will currently happen is that KVM_SET_XSAVE will fail with -EINVAL
because userspace is attempting to load data that Host B is incapable of loading.

The change you're suggesting would result in KVM dropping the data for X and
letting KVM_SET_XSAVE succeed, *for an xfeature that is exposed to the guest*.
I.e. for all intents and purposes, KVM would deliberately corrupt guest data.

> Is there an RFC or document which captures expectations of this form?

Not AFAIK.  :-/
