Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472167;
	b=wY+Of+/iaWoqD19DKnAszHyb9ITucQCo0SgUnQE50+DVjApXr98UZ9DzxEuXh9gtJoyN
	 s9k5lIIdgSlw2IdnOCXmRu09vo3QSMIbYhcN4fxyAmXaRcUUTNvvbp4ee33Y/1BO5VLQg
	 YwpiULhZE6lyPRPuhy8r+lu+YGQTEWWFo6V3McTOlTiSWHnq0dcdDR8zsqGeTorlFmtzD
	 Zx9pqt25xJ6ovoTP0UR6U+rhCJgratT80EbHmiPQ3mS/KjqD3VkFmUIstywI621JCJEki
	 zObO5wb/LFHumrx4Z9v3wKktABMFHsuFuvUNEPC4dUvDSeGqkU8G4N8YXss73pQdSRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472167;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=Y+us8bDvYzrELNB2EmszKrRoOfYz0IPLr/AEaWpCZcc=;
	b=ACP0IJ8lbqPEIAyfGvA1akdYY1Ppzk8v1fxWfBBdhOsl4qjpbTpHp3sHKreSGHpiTwX3
	 Fjh9kduwE8IMxhRxjouFwAXtWNZA3pDFTYHfPxtCxN6qf48B0zyWfnA9WNVdY2ToabQm0
	 uEWs7h1fL8GVsIqWYjYICHdmj3eQTnrWKtLM5ncts8jEKEuixnlGrfQjsT56pjuAid7l/
	 VCCJRcHKqBVtHlvXq01U0L2ShDD6eAkcEg+jC3B+NTaWCAYkTGEhl1q1WxDMuJHWm/ZRf
	 yqDr1Z318+4+18Nr76VsbwdFVWgmn0TugVRaWeDkfVheeXqNxN75FS+rb94Zwxj9xTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWCjE+Yl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77430606A31E;
	Mon, 23 Nov 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWCjE+Yl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADE61F000CA;
	Mon, 23 Nov 2026 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795472167;
	bh=Y+us8bDvYzrELNB2EmszKrRoOfYz0IPLr/AEaWpCZcc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=WWCjE+YlrqN7b90/hGO2sVl11Cr18YUJcvwyO3i9GeI+bRqWmlBtpjqp0OFJcNdVT
	 H6cTmheE/TJRGpT6Nd9zvJKv+UonCFjBKp8UB+/E/SKrJgBmZlVo9mC/wY+Fi4YSwi
	 DDgKAAul9Gopl/aCGGUUgvPZwKX5Ytj43+wMBxwecLgJ5Zmdj7XaDCyhFzDKkWeOGx
	 l742vWA/A8irvG1/3XXyaG7iHbiRRISA4f6uhCd2wFJ+wFhUApc0sMFV153E8m7fXh
	 D8D7hpWuShvXto/+mZmfKNFLkw/6h7Rg8rfWnnUoPz47g07ZDRib1TwWYt/Y7lZERg
	 57KVY+1JTEqNw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 9F2E9198003A;
	Mon, 23 Nov 2026 17:16:04 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 17:16:04 -0500
X-ME-Sender: <xms:IrsEa1EIN0A2-yRAGEUfkQudu24m-cMJ9pwJk1WsjX3QZ4ZFlcfKLQ>
    <xme:IrsEa1IkIo2YvVit0dD7-gBdhXFdfIsZNqqqxezefVQ3BGMX6In22XOs1ZrVtDThe
    clH6y2UDtaklbrB8vJ3sLfq3_nzSvFZ4XkkoQ-Ul9hvlLbuDuWKpOeQ>
X-ME-Proxy-Cause: dmFkZTGqW0OWpKbdMalrHhevj6rAz4tiCiG3kxK+BUuRG5tBW4U/gofM3BJohdno3TNWPn
    spYDa3MoKslPvwIBQziz9w06QxM0np0B2g6emIa8amZcnDdU6eOxtkmo6MB9jwmZ1XKje3
    2pGQB9WJZNsz+ULo2BKVs5rzk04SbiQrnFZZLjIN43SiZrfpxGEDe/9KYqvtllLTZw0WQR
    nsctd53BRHelMvy/jeyeDbcZVr/jteSpC9BVVCxp2EPds3zvYXumuUDxowL7SoxQ+JPBYV
    Ocsnw9BYxviGEsVOwPog9mVxmPoGDX0NPp8+3cscKFi6lolWH5S6tg/pON6ZZHrg6chVJm
    PIYgk/Uz9OPfT5V+4WuMplcixrDb0ZzGw951ptBv3X0EQTlHenxUogwPXMFo5Mx1vufyem
    b43KzrKYD8bBRAGSESSyQ4HKRvLx7U2de1a9AJDHtFlBaPLHNvpRLN/jpIo7bJDlBJwBRB
    HB2UtGcbyOhjl2FKBEVifdz9jEEo+df9EFEsEbZ9jQR9egFvTtUtuOAr09pLopAZa8uLg1
    E9TWPm6mJQwLSgkegqtX2q2SMLbzf1PWaTag8PnzYZp7gm7UMtk5Ets3uUvX97dezc57MU
    3qMAZnZsop9p9V5VyB1tvE3gy7jC3hAvq71vCWJsBT3NJruBjuf4YQjQ3szg
X-ME-Proxy: <xmx:JLsEa6550OBI4a4JzqKo9xWUEAscssHMrZce7qD7yx4L1yrpBabxvQ>
    <xmx:JLsEawlvKCQ9mi3Rx0R9eM08i3xjDZJQIcWG7eJeMdTs10x2QOlvMA>
    <xmx:JLsEa9U_M11YtZ-itt9LgXC9Ez5koyzF7_gI6EZk3_Jfgd0qZGxOTQ>
    <xmx:JLsEaxR_TebYxTMAa8om3xsn42NT1Up6jQreil9sQwR9es6PRiirag>
    <xmx:JLsEayBhEvU4nrC5VHlDtlLU-i6h1HUpCMqOSOJpv49MGTxGwJJIEQ6R>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0F97AF8009D; Mon, 23 Nov 2026 17:16:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 23:15:15 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Ard Biesheuvel" <ardb+git@google.com>,
 "Bill Wendling" <morbo@google.com>, linux-kernel@vger.kernel.org,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Waiman Long" <longman@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev
Message-Id: <41269072-a460-4a2f-ad15-e8eaeb411339@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
References: <20261122105646.2223131-2-ardb+git@google.com>
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
 <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock pointer if
 unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026, at 22:52, Nick Desaulniers wrote:
> On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
>>
>>
>> On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
>> > Very detailed commit message, but you kind of bury the lede here on
>> > what the actual problem this patch is fixing *is*.
>> >
>>
>> Apologies. I'll trim it down,
>>
>> The TL;DR is that non-volatile asm() statements with memory input
>> operands are not elided by Clang if their output is never used.
>
> That's not a bug; both Clang and GCC behave that way.
> https://godbolt.org/z/sEhec4oae
>

Try changing that to

asm("# hello world %0": "=3Dr"(x) :"m"(x));

(and don't touch x afterwards)
