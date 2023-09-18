Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87420B03
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 16:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B6C433C7;
	Mon, 18 Sep 2023 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695055847;
	bh=8JxeeNt0YIANYdkuILxO1QdRpilUqSWyV1gcj/PegTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlpAl0p0ot/ZdMds5/dzHxWvSvCvoB6UFz2DNFt8l8uvRG06FlLRX1IMnpZk5FAWt
	 xp0hbr0IHEFQ8Fc9h3/iFakdDYOh+hd7LgzCYbXYqenvfRcEONW4VaxI42nvK2WIZZ
	 0Qr1iqebzd7NopusIhwRMtqzJSmzNtRUve6/yNd/Fc3zlQ1DesWAeVlu/qQ0Cf7puc
	 5/ZrtsowpVcbuRfia4JAsYX+W/BVhF9UFxa9SiAAx+NIbe3W5bA5S0KuHJ9fybFKPZ
	 CPO1pzBAZTZXVwmZhaqHYiWkwPs6RrmFUErlYXc8RYn6MYkOpjlgGUWaqpHI9NmPkD
	 x9hzbmwpPZKJg==
Date: Mon, 18 Sep 2023 12:50:45 -0400
From: Sasha Levin <sashal@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, keescook@chromium.org,
	Conor Dooley <conor.dooley@microchip.com>, nathan@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ndesaulniers@google.com, peterz@infradead.org,
	ajones@ventanamicro.com, heiko@sntech.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, liaochang1@huawei.com,
	namcaov@gmail.com, andy.chiu@sifive.com, guoren@kernel.org,
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>,
	jeeheng.sia@starfivetech.com, jszhang@kernel.org,
	greentime.hu@sifive.com, masahiroy@kernel.org,
	apatel@ventanamicro.com, mnissler@rivosinc.com,
	coelacanthushex@gmail.com, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.4 25/25] riscv: Add CFI error handling
Message-ID: <ZQh/5ZnoI6dnTonS@sashalap>
References: <20230909003715.3579761-25-sashal@kernel.org>
 <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
 <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>

On Mon, Sep 11, 2023 at 08:03:38AM -0700, Sami Tolvanen wrote:
>On Fri, Sep 8, 2023 at 8:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> Sami probably understands the dependencies better than I do, but I don't
>> think this one is sane to just backport -- there's a whole series here,
>> and IIRC we had to set up some clang bits for it to work correctly.
>
>Agreed, it doesn't really make sense to backport this patch.

Ack, it's gone :)

-- 
Thanks,
Sasha
