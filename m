Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D396F7C
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 15:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818ECC340F3
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645803502;
	bh=Qp6aGn+gfpXQjgM8XZgj/bDqpiOmsivhTJEvuTz+fDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vKYh1x0GLneHhE/0yXjH1+P2NcfgvGJ3rCBu/pBYythxhJYskOaY0cmc7hWO4hiPz
	 68HtLHzakEQIt9ab4Oh9cw7bOTzhwh+6FB/vhIbFOQU+sQerX5/FIxGW+iEGN9b2NJ
	 QbnFnvcW6iL0ElUVoOpWEik/X3w82RwNCbmdYvQWoxvBQTqI1yS7C5hgMgwx1/6750
	 MR2ctkpc7CDcrWOGB07E7GwZY4AOzEqk1VQyG+269hgNHnaTA2X2g97sWnSVV8HZV/
	 vY5Aw9WvYq/cnbeUBCD33rTerbIScpj1+E3HCzJftDyqekClorrI5KpA0qMfwcuJfb
	 Z+RUrCbwGQZqg==
Received: by mail-yb1-f179.google.com with SMTP id bt13so6642574ybb.2
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 07:38:22 -0800 (PST)
X-Gm-Message-State: AOAM530LjxvG2+HkQ85o7lnYdfTIYi7T8X+SetzfPZKhFhyMgRiZtN7Y
	w9nFg3dCr6V8JQ/JuOvLjh9edZca+OB206x+TzU=
X-Google-Smtp-Source: ABdhPJx3rvESMXLxmCbN7BFFRnF9VG0LfFW9lEx0SZZrJ9ggiEnkwCvqiu8bEDq0wko4R3DdaAXk1mMrwpgvYOmaWJ4=
X-Received: by 2002:a25:6c43:0:b0:61d:e94b:3c55 with SMTP id
 h64-20020a256c43000000b0061de94b3c55mr7907145ybc.224.1645803501561; Fri, 25
 Feb 2022 07:38:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222165212.2005066-7-kaleshsingh@google.com>
 <202202231727.L621fVgD-lkp@intel.com> <875yp63ptg.wl-maz@kernel.org>
 <YhYpvfZaSjrAtkZp@rli9-dbox> <cb750267af0636c49d2f8aa354f086a5@kernel.org>
 <CAMj1kXHsNsQXbeeS1zcy+xYA7kSE5apbLpChohfvkABS7Z6jKg@mail.gmail.com>
 <89c48bd2a9b32b4607d1515714fa3c1b@kernel.org> <16f47fa9-90b4-0b5c-33cb-cb004fc39266@intel.com>
In-Reply-To: <16f47fa9-90b4-0b5c-33cb-cb004fc39266@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Feb 2022 16:38:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEfsxj44t13rpgNddvTeM3qgfv5zU_xpnxn7HV3xUN2YA@mail.gmail.com>
Message-ID: <CAMj1kXEfsxj44t13rpgNddvTeM3qgfv5zU_xpnxn7HV3xUN2YA@mail.gmail.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 6/9] KVM: arm64: Detect and handle
 hypervisor stack overflows
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Android Kernel Team <kernel-team@android.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Joey Gouly <joey.gouly@arm.com>, Peter Collingbourne <pcc@google.com>, Andrew Scull <ascull@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Feb 2022 at 03:12, Chen, Rong A <rong.a.chen@intel.com> wrote:
>
>
>

> Hi Marc, Ard,
>
> We have ignored the warning related to asmlinkage according to the below
> advice:
>
> https://lore.kernel.org/lkml/CAMj1kXHrRYagSVniSetHdG15rkQS+fm4zVOtN=Zda3W0QaEoJA@mail.gmail.com/
>

Excellent! Thanks for implementing this - I wasn't aware that you
adopted this suggestion.

> do you want the bot ignore such warning if asmlinkage not specified?
>

Even though I think this warning has little value, I think asmlinkage
is sufficient for us to avoid it for symbols that are exported for use
by assembler code.

So I don't think this additional change is needed.

-- 
Ard.
