Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF31FCE
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 11:24:30 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id y141so4733625iof.5
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 04:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fsVCs4sBW7mt/Ih6nbdJIMUX5/GY7OGQyDYGufKtJuY=;
        b=iN0JOF+g9QGNk9LTGtdxKX8dUCLOL8R1PzDjBH+vqr/6EWFF0hOr78E/FIdwxCzCqI
         Wie6LcvFlEOy/Mks2qbbgt7X1HE7B5KfHuYeUC5mZI3rl5VyYAxwXDz6lLSVRx+f0Mmu
         znTFjjvTyefD9xpeTjUW+Y6z1YRYvV+9CEhPUNcxz126x3lQ9dx6/IepaouRgG9a+UHP
         OCSz4gs0hkBpbhp1rcH46JH5Ry6WEW65xs1Fu80gCyBLjvkR5X02sL08jhBEN2N20HJf
         FFKIIeH4y9HMYHGhWeLV4gEV3crUeCSrd8hoe5GTM3XDNaQ6JEvRdEyx+AU8uvZzx9Hq
         DnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fsVCs4sBW7mt/Ih6nbdJIMUX5/GY7OGQyDYGufKtJuY=;
        b=Yg46UrGnITgDlrSZFhggXt6JuEKde2G41CzgA3vkotMPAIYia+5GKtyEEGyBpevCvk
         vaJRyEF54NWWC2FVuz0dG7EgMzZtZ/HT+YgHX3nbpSe0EcW+wCZ6H2my4CPPDimJa8FW
         eO2nLnn8T8LadVX/VfxAOE5fbxfQDQZJsAAHgjxvFKBxKafRo35dtfPY8mlDzYvam86/
         eymXCeD82/wyUbAU5VQUQttCtA2xdo5++S7ZFoXl38QVg0vrlErv96szqRtuhpi2MQVq
         b6h3LJMI4IdV5+3UxAC6dvYbDX7RhyHpBsVFyK90Jqbhudrir07lMZDf3dVeph9i4HEY
         cHYQ==
X-Gm-Message-State: ACrzQf2UzECVSdW3Twseni00v8/6+5VYsTxk2o1+jV6NT++6kBroTjZi
	QlTevi7MehI993EgpBpRlMV38SDGIZiXmrknH1Q=
X-Google-Smtp-Source: AMsMyM6uOuMdp3diWSaDOVFlUXXzn9Z7lcYdIt7nzwrMplXw4mcnKhKdpeKYa3ux/SOSGvIDD+74pDS0N6SFW8ntAlc=
X-Received: by 2002:a05:6638:144f:b0:35a:68ad:ea0e with SMTP id
 l15-20020a056638144f00b0035a68adea0emr13186136jad.199.1663759469399; Wed, 21
 Sep 2022 04:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220920192202.190793-1-keescook@chromium.org> <20220920192202.190793-5-keescook@chromium.org>
In-Reply-To: <20220920192202.190793-5-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Sep 2022 13:24:18 +0200
Message-ID: <CANiq72n+vTg6cq3TRjJ97H_B3-Vv68itpW1+E66+Pa3zCTch6g@mail.gmail.com>
Subject: Re: [PATCH 4/4] fortify: Use __builtin_dynamic_object_size() when available
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Siddhesh Poyarekar <siddhesh@gotplt.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 20, 2022 at 9:22 PM Kees Cook <keescook@chromium.org> wrote:
>
>  include/linux/compiler_attributes.h | 5 +++++

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
