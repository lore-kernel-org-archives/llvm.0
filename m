Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE4111B
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 01:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9jGoe14"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f2c7a4f24so5965297b3.0
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 18:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696469403; x=1697074203; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqc981CBMLWk+FQW6EA7FJZRSQfVRhbIKI7MGCKnNEk=;
        b=K9jGoe14PIJy0JhnX7Ivy9fY8CyUJMEaBPn23KuhbvPC0eNcnHotpdrggQUJzyJ0MV
         /MkqRF+NNbFbabI/6yyGfau8CZKBRHj7l+IvhUEk3Q9zCZ7po4tWmo7asLo3YX4suQqw
         xq/cGkuoHo1JlqYEMCx+MwvwzM5DQlZZ7q4zQX/mShzbGxsotoEg9qQ8SWbZ6Aor//et
         GefPL7HBh+fS1fXVkCRab6Yf5XveqHrReRNbS994tsXIqxmd93iYHDR7KyIH5MxJOs5Z
         kD8Nq4T2E+jLq03PyC5fZGT62b5o9M5AcgV4wiB8YkeuTanxW61S1mPfyxxhtn6aFXfx
         f3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696469403; x=1697074203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqc981CBMLWk+FQW6EA7FJZRSQfVRhbIKI7MGCKnNEk=;
        b=M0v1nWr68D48TB63PBFNb5W3ObbJwU679bQN7Ov289XOrLWkaEnTnjqMCOSX1g9jJe
         EzDooU63ifPyL0gl68nu3bjf3W+lNey6YoRo8jC4Omu1juNZf8Gs7rOkBDn9jdRi49/V
         Fn0gWdF/lN1TdEXyDT3dRKdFdXC7g43qih+PV0LvwvqGK2im/4Cbcu6AvRAL67FJf2b/
         fCMGjZ5zwY2cQhuMgUb7eZtNPjeIj8hIOZNz09C8wJb4tw1LgTpOwBPyzEezVNxEwQn6
         DZQ4hCu93cS6U/KBy+Yhaz9pMVE6MSPxI/13g/5mEAKTBZaGrSDY2aG7jEuXdAZx59Xb
         tUfQ==
X-Gm-Message-State: AOJu0YxpP4hD2h5VQSm1xj71G/4qVAkb1vpem5ZcUYjQo+Q3Ea2ZY4s7
	DybEtKEHvh77aJKsixWPeT8I0Zdd4ZQ=
X-Google-Smtp-Source: AGHT+IFqbf0gkO9Qoa4YBFhqDgjc+6TQ/LCF7VPFui1r6bU6n9f4cTS1dfvkOaHDVedFUeqKKjsNdPOL4Qc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:431d:0:b0:59b:e684:3c76 with SMTP id
 q29-20020a81431d000000b0059be6843c76mr66748ywa.2.1696469403561; Wed, 04 Oct
 2023 18:30:03 -0700 (PDT)
Date: Wed,  4 Oct 2023 18:29:23 -0700
In-Reply-To: <20230928001956.924301-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <169644980223.2754169.1786296654866171118.b4-ty@google.com>
Subject: Re: [PATCH 0/5] KVM: x86: Fix breakage in KVM_SET_XSAVE's ABI
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Tyler Stachecki <stachecki.tyler@gmail.com>, Leonardo Bras <leobras@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 27 Sep 2023 17:19:51 -0700, Sean Christopherson wrote:
> Rework how KVM limits guest-unsupported xfeatures to effectively hide
> only when saving state for userspace (KVM_GET_XSAVE), i.e. to let userspace
> load all host-supported xfeatures (via KVM_SET_XSAVE) irrespective of
> what features have been exposed to the guest.
> 
> The effect on KVM_SET_XSAVE was knowingly done by commit ad856280ddea
> ("x86/kvm/fpu: Limit guest user_xfeatures to supported bits of XCR0"):
> 
> [...]

Applied to kvm-x86 fpu, even though there is still ongoing discussion.  I want
to get this exposure in -next sooner than later.  I'll keep this in its own
branch so it'll be easier to rewrite/discard if necessary.

[1/5] x86/fpu: Allow caller to constrain xfeatures when copying to uabi buffer
      https://github.com/kvm-x86/linux/commit/2d287ec65e79
[2/5] KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}
      https://github.com/kvm-x86/linux/commit/27526efb5cff
[3/5] KVM: selftests: Touch relevant XSAVE state in guest for state test
      https://github.com/kvm-x86/linux/commit/ff0654c71fb6
[4/5] KVM: selftests: Load XSAVE state into untouched vCPU during state test
      https://github.com/kvm-x86/linux/commit/d7b8762ec4a3
[5/5] KVM: selftests: Force load all supported XSAVE state in state test
      https://github.com/kvm-x86/linux/commit/afb2c7e27a7f

--
https://github.com/kvm-x86/linux/tree/next
