Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0DC18E39
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 15:29:18 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-65d01a847b3so14268756d6.2
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696433357; x=1697038157; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pp3fcQ7FJOqborLPqxKyTwdh4X5c9UMKg0BftM+5OM=;
        b=DsQA5ba8uzL5eUT2QZLzfbE7pYx5nxJyaSev5pmy9XNYS/xKXjFWmkyjf0BOt3VjYZ
         MLpIn2wQxczKH5AlieC1+yuU8m/f30liOi8ldNyfXoKZksqWK4Z+fVN/j/VRL2LzFKkC
         9b64dMG6K+Y4jukfX8x4aPlxk3pp4ry+/EGBWbI0kWwKsOewrMhJP6qfnYDQkTsM+GdA
         Yv9p+0V4bgxA4EcQI/SoFG/L+7MsNK1SKfhWU95z4GWv6Xn5sNdJA4XKgWXN1PqeFcvZ
         5lpEu98DO1l5F6qZgCj1QQGo1FQcO4acaFpwPPLgtV3F8FtkBdx9NtQAyLqCOsQjOkM+
         9DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696433357; x=1697038157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pp3fcQ7FJOqborLPqxKyTwdh4X5c9UMKg0BftM+5OM=;
        b=szBgPz3XCpmH6Ho7iNrOWKwJw2P7ounv0jYdsKFibT/7+8hme0KE1LuwakbjAtNplA
         tMVbVHLTaRp14W4AjJc9ump3W2ww8vQ28rEZHf2T3c/pmHEkTmA/2YuE4sfoMtL9TCnu
         P6u/7QuW/h0/G1yiDOEtmS8IGg2JDKYLWg2+F5mracpbpix9ebmD1aZlAqNhSdme5k5q
         sF/2nbOntzv3LcFyzoOe3GTQPLIztFm6SBp0jTZdQS3pEgS1kPSyovbNYLV7nW6sTcZv
         CNfVNbpIBjUAn0iVjmI6y6WDZspo8If5OvEHkErcSJmycTKzP2+KaTYZP6o4UFMs4bzR
         +avg==
X-Gm-Message-State: AOJu0Yxz68r2keSZ0eO50MHNj23z4iTbdRlt+7Uj6EXsHK5V51m0OTGb
	iQ6f+HfLS6C/gbKehi20h9Q=
X-Google-Smtp-Source: AGHT+IErN77YwXwvT/7yy4wgBAH4cMWdYh0XlJUsosZnTUdal8Ue3ccamEsrM08lCtZNGjyn4NScDw==
X-Received: by 2002:a05:6214:3019:b0:65b:150e:604b with SMTP id ke25-20020a056214301900b0065b150e604bmr2806646qvb.49.1696433357301;
        Wed, 04 Oct 2023 08:29:17 -0700 (PDT)
Received: from luigi.stachecki.net ([65.115.226.163])
        by smtp.gmail.com with ESMTPSA id c12-20020a0cca0c000000b0065b21b232bfsm1389520qvk.138.2023.10.04.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:29:16 -0700 (PDT)
Date: Wed, 4 Oct 2023 11:29:13 -0400
From: Tyler Stachecki <stachecki.tyler@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/5] KVM: x86: Fix breakage in KVM_SET_XSAVE's ABI
Message-ID: <ZR2EyUULbRpXW8wK@luigi.stachecki.net>
References: <20230928001956.924301-1-seanjc@google.com>
 <ZR0QOGo5DftkRWsr@redhat.com>
 <ZR1Yt6Z+dhMbn/FJ@luigi.stachecki.net>
 <ZR175enUCh3KkAU6@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR175enUCh3KkAU6@google.com>

On Wed, Oct 04, 2023 at 07:51:17AM -0700, Sean Christopherson wrote:
> KVM's ABI has no formal notion of guest boot=>shutdown or live migration.  The
> myriad KVM_GET_* APIs allow taking a snapshot of guest state, and the KVM_SET_*
> APIs allow loading a snapshot of guest state.  Live migration is probably the most
> common use of those APIs, but there are other use cases.

I think the lightbulb just clicked, it is really this:

> No, the VM will not have less features, because KVM_SET_XSAVE loads *data*, not
> features [...]

I think I'm conflating the data vs. features aspect here and will have to
revisit my understanding of the code...

> > Ultimately, this problem is not really fixable if said features cannot be
> > removed.

> It's not about removing features.  The change you're asking for is to have KVM
> *silently* drop data.  Aside from the fact that such a change would break KVM's
> ABI, silently ignoring data that userspace has explicitly requested be loaded for
> a vCPU is incredibly dangerous.

Sorry if it came off that way - I fully understand and am resigned to the "you
break it, you keep both halves" nature of what I had initially proposed and
that it is not a generally tractable solution.

That being said, I genuinely appreciate your jump to action on this problem!

Thanks,
Tyler
