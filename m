Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91142579
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 15:21:35 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i6so1751478pfb.2
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+DNNP6SHxbQnNh6YvMOmq3FXeAXvMFe/ESayAoZ8RAc=;
        b=QfjHyNuy9ubDPnO1F1EywSQRa43BRlBD1elemgCKhFUx95gJTgftGmM7zenvcr+vP2
         NNPXYODaUrG6ZcL5ShCQGniRniwQ9Q0dgfD8Yc18qmR8S43eQn45iL5YamTQepz4Oe+z
         5AvilvLcNkYHY1lg5izYSjO9yrnYsPRZhSJhgZBl30ETXDtv8N3ul4SM1BtZ/MZdqAj6
         vgdHNj6co8pMsjnpJbwi6LZl2A9XlBzg3xkLAF1oXD4Z5UyzOMz8jEblFDXNT0MfpgQh
         3iSAeaYikiItVFN4amJ5xmljriRfxGOWNZS7c4U/DHQGX7S/X0JQ9rZEqVZAoIuMVLHO
         YUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+DNNP6SHxbQnNh6YvMOmq3FXeAXvMFe/ESayAoZ8RAc=;
        b=PiDEMGoPXWkZf2aFIZNAeoMbNJ4wKFQ7BWKmV1IPFkX+L9Gob0ZrzEi8W53P6mesPK
         KR9RtV36Gg61I5tHUQ6V20rEpml5kbPN6oejZUhfvQU1l+rA8PA2EQlw/pUctflI90Gr
         BmBd1EO0kyS1jFGJVUDJQKKWuktjWL5qM4bhMPqduMIbe2lL+rdT+EUnMWsosJZB7zvU
         h+wOKukvuzSn/sEY5rkNpniSbeHe7m24Am/eiukhm4FSKRfZXYyb7TjYr3XxJWM2BVRo
         lKQ81DujhUklUFRyYh6PlVwlEX0yiSwgARSi3hB+fee9tTIlbUNbfoXKbRhtSaGXy1E3
         e5Vg==
X-Gm-Message-State: ACrzQf3Huq01PCc2rUwEd8y0pyVwoJHpwk7rUSn9c/q+z7icBjTaQ20G
	AvPxd9rlofSqeXMhtguLdfUcmw==
X-Google-Smtp-Source: AMsMyM7H917Sg+MttAyxwzaKo5iPEQjGqRIX6khDOT3zeXNheBMvFb18YVSJGNVn/GVF8iOJdQWNHw==
X-Received: by 2002:a65:4508:0:b0:43c:e3c6:d1c2 with SMTP id n8-20020a654508000000b0043ce3c6d1c2mr3341488pgq.582.1664464895083;
        Thu, 29 Sep 2022 08:21:35 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902758300b001750b31faabsm5967160pll.262.2022.09.29.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:21:34 -0700 (PDT)
Date: Thu, 29 Sep 2022 15:21:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v2 1/7] KVM: selftests: Implement memcmp(), memcpy(), and
 memset() for guest use
Message-ID: <YzW3+0yIkMwi4YdT@google.com>
References: <20220928233652.783504-1-seanjc@google.com>
 <20220928233652.783504-2-seanjc@google.com>
 <20220929084855.26t6r6aaurm2caum@kamzik>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929084855.26t6r6aaurm2caum@kamzik>

On Thu, Sep 29, 2022, Andrew Jones wrote:
> On Wed, Sep 28, 2022 at 11:36:46PM +0000, Sean Christopherson wrote:
> > @@ -232,6 +235,12 @@ $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c
> >  $(LIBKVM_S_OBJ): $(OUTPUT)/%.o: %.S
> >  	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> >  
> > +# Compile the string overrides as freestanding to prevent the compiler from
> > +# generating self-referential code, e.g. with "freestanding" the compiler may
>                                             ^ without

Oof, good eyes.  Thanks!
