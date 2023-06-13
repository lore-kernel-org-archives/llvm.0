Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9129B0;
	Tue, 13 Jun 2023 10:35:57 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:ac8f:54cf:6e66:b8b4] (unknown [IPv6:2001:861:4a40:8620:ac8f:54cf:6e66:b8b4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36D576606EFD;
	Tue, 13 Jun 2023 11:35:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686652550;
	bh=QvZoVMtSRfbKYzNTR8JdqBOwdHvxzvmP3UiPrsmqRzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g2kPUpusiVLEUh6bkquiemGCKqej3sLrqklLNIMGKqIk/hL62sKgNOIL6vWcevJco
	 9HzbA6VKv922k2F/ncvzfIxEEJTnH36I+HwWrV+aFbH+f2Kn1FG8RmBhNDGoFPG2LW
	 KBneWqBHdZ1F9CT1bxWmgZPfg5HvD+V0d0yGaoY256aHjpkc8e1yLcYc0MtpnteVW5
	 ffqnMJ7MUtI4LuU8HuprAgmADoVTitnPGiZOHw86buQnm9Gx4hnThK3FGUO+tAQCdK
	 9HpS9bigXubEEBMg/XgjxoneudHrVRGZJ6QwWHKbDPibhXUigoOoKPS8unctMu5YJ6
	 mMjUWuJ0OJS0w==
Message-ID: <dfa85ccc-693b-00cb-a4d9-af32e0dfbed8@collabora.com>
Date: Tue, 13 Jun 2023 12:37:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: kernelci: please upgrade clang-17
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>
References: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
 <262df5fd-d8c4-47aa-a65d-dd79a303a9ca@sirena.org.uk>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <262df5fd-d8c4-47aa-a65d-dd79a303a9ca@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2023 17:11, Mark Brown wrote:
> On Fri, Jun 09, 2023 at 01:50:13PM -0700, Nick Desaulniers wrote:
>> Starting a new thread because gmail cannot handle replying to an email
>> w/ >45k warnings.
>> https://lore.kernel.org/llvm/6482b7dd.170a0220.a93c3.9102@mx.google.com/
>>
>> instances of -Wbuiltin-macro-redefined have been fixed in ToT llvm.
>> Updating clang-17 should resolve most of the error spew.
>>
>> Does kernel CI update ToT clang builds on a fixed cadence?
> 
> The containers with the tools should be being rebuilt during the
> production update which normally happens every Monday.  There's some
> disruption at the minute due to some infrastructure rebuilding that's
> going on so today's update of the containers might be delayed.

Yes the LLVM-17 update has now trickled down into production and
warnings are all gone:

  https://storage.kernelci.org/next/master/next-20230613/arm/multi_v7_defconfig/clang-17/logs/kernel.log

compared with the previous linux-next build which had all the warnings:

  https://storage.kernelci.org/next/master/next-20230609/arm/multi_v7_defconfig/clang-17/logs/kernel.log

We skipped the regular production update last Monday to focus on
migrating VMs to the new Azure subscription, sorry for the
inconvenience.  We're back on the regular schedule now.

Thanks,
Guillaume

