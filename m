Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E210113AD4
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 16:54:57 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f67676065so33540577b3.0
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696438497; x=1697043297; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v1SpCSVBVkGWfR+UVpLKMyMdKYaLIo/4ycal5KL0JmU=;
        b=KHY9i3ZzEpqK6lTK/j5VHFqn/ao9n2F2Z+ocBRWCqXxkyGWquFE+JHdNRBbMYn0iAd
         axBmoptWgTwmydfPW71LIX/eVa6an8BgwZYJgkSCHVYCGF29kW6im+zMhmpQw8cW5x6m
         sNpJn+uoDnZny09D4JuP0B6gH4QXAKRz60/cpnR9ZlWlI6TVl7b/1xbUVLoUd0vGZ0On
         Tr81of/brMUbamr+JSGi5/+yk32OqdT5ws5CKpeNu9kkbQaAglHw2LZLZYA+HM3H/ApM
         bNh5S4r+scr4XXof7DIX0Hggyxsem4Hjk2St1k8Pqj488Iv6e5ZfXDhXXqQ/uaQoOZAl
         r2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696438497; x=1697043297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1SpCSVBVkGWfR+UVpLKMyMdKYaLIo/4ycal5KL0JmU=;
        b=pEA2LIrju0KKTaa3yLQujEzEEuclRijXen8gjXEJ9QL5Jxo+Cx6YIKAxYFYIVT8i7s
         ZPwux7Isp0uF1Sw72+JLAp39MT8mc1ieB2dYyaKUhfILnYSTS8nINbfCIiwWyZ/Ccq4w
         Zu0/aDNQPy01SlKgRuYyPLkcHuURuJ07cTJdQjoWW5Pdx2KnJBfFhEGcSHCil9LqqW+E
         NINYN2yp+y1OXfZ2GsFeKLAIGvaje0p7XQ/dNspDR5TpKZrv3NOZyxIru3NVyONOLRm+
         zsiY1Kv4XLRf8z6TFwNkgThogzSUaVuIt0tl0Le8QzeG2QcCcLILUVwTKMT4PJ6ZxEmi
         FaQw==
X-Gm-Message-State: AOJu0YzkhoQl0YFKQ3uOlNbdpcQ1QyF/Cp5I+aEsk9rdpBZHU9Hah6ke
	4MkGU3f5TuqrMG0VGHZ3bSvr9A5aGOY=
X-Google-Smtp-Source: AGHT+IF4i+oQKJd8u1V+TB1VPIOAogrhPtMWZdEvSZy8rU+jM1S65yQ94jKQ9NyvjRiXgJ/MLji9dcyTwZ4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a909:0:b0:59b:e97e:f7e3 with SMTP id
 g9-20020a81a909000000b0059be97ef7e3mr53564ywh.2.1696438496733; Wed, 04 Oct
 2023 09:54:56 -0700 (PDT)
Date: Wed, 4 Oct 2023 09:54:55 -0700
In-Reply-To: <ZR2EyUULbRpXW8wK@luigi.stachecki.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com> <ZR0QOGo5DftkRWsr@redhat.com>
 <ZR1Yt6Z+dhMbn/FJ@luigi.stachecki.net> <ZR175enUCh3KkAU6@google.com> <ZR2EyUULbRpXW8wK@luigi.stachecki.net>
Message-ID: <ZR2Y34hFpLmCYsUr@google.com>
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
> On Wed, Oct 04, 2023 at 07:51:17AM -0700, Sean Christopherson wrote:
 
> > It's not about removing features.  The change you're asking for is to have KVM
> > *silently* drop data.  Aside from the fact that such a change would break KVM's
> > ABI, silently ignoring data that userspace has explicitly requested be loaded for
> > a vCPU is incredibly dangerous.
> 
> Sorry if it came off that way

No need to apologise, you got bit by a nasty kernel bug and are trying to find a
solution.  There's nothing wrong with that.

> I fully understand and am resigned to the "you
> break it, you keep both halves" nature of what I had initially proposed and
> that it is not a generally tractable solution.

Yeah, the crux of the matter is that we have no control or even knowledge of who
all is using KVM, with what userspace VMM, on what hardware, etc.  E.g. if this
bug were affecting our fleet and for some reason we couldn't address the problem
in userspace, carrying a hack in KVM in our internal kernel would probably be a
viable option because we can do a proper risk assessment.  E.g. we know and control
exactly what userspace we're running, the underlying hardware in affected pools,
what features are exposed to the guest, etc.  And we could revert the hack once
all affected VMs had been sanitized.
