Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF82C80
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640805965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X92anWu7YA4HMgaOFRPoEtvjubDlUwqFYaCnsFgT4Q=;
	b=TGhTI2c67L/KOKblpmm7GjfA7peS1ec5ovgmnQ8WCjdh3oxRg/MfUMLbutxZpOZxksgTQB
	/nRGhSfZuJL8j0kUli6Dk2IkSSZZ0aro8gjqM7ZWQKzFKZOjh2pVb8YtgfS5MuuiyMrG6o
	Eo6F3kFtf3ZCES8woMpkU/ITBMnNhcs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-XUs4xmC9OIKFiCBXmFSY5A-1; Wed, 29 Dec 2021 14:26:03 -0500
X-MC-Unique: XUs4xmC9OIKFiCBXmFSY5A-1
Received: by mail-qv1-f69.google.com with SMTP id fw10-20020a056214238a00b003c05d328ad2so17814280qvb.2
        for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 11:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7X92anWu7YA4HMgaOFRPoEtvjubDlUwqFYaCnsFgT4Q=;
        b=BTvVzKb4vuo/wsGuEW/XcBop2308Ju6e6zF29qTpWBZzuf0EM8Vu+ymZ9LMD7LOeK/
         6YziRcWhtfD+I8sHsPkgBl3aTggGDIzY50X9zeK2AF9d92h+KO8/dfd/3tmxOlnUJj7g
         FRbMuVHEzf+csNC17nYbs+g1V6PG/gVrVu403B+ZFXaktEgLrFThs7TJI9QAowJgLk+f
         4F37hJIZeAqFVS23ny7ePJux2RWSWsEI80OD03stmR21uXkqABuPtUEpykdqUL7K6jGW
         b5BbyaDIsdF6iKS8XxaryQCRQNpPjNxGYTixDkGud3hgeH6Us3hzQMX4/DorS0+hUzyJ
         QPXQ==
X-Gm-Message-State: AOAM5329xvdRYbVcorhauu2MzFA6ZP7g5eaOyngfS2AyjrP3VKmBdpXJ
	FjVZFqGc5GVI2s3ecBf9im21qSxVwm4sUk6MHBLBzx5JPZoxpLUqapZdw8iTHqSyWvc5cBAxaMB
	DMcYD0zxUgXuuag==
X-Received: by 2002:a05:622a:180c:: with SMTP id t12mr24151805qtc.507.1640805963408;
        Wed, 29 Dec 2021 11:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCMkCBBIEHoU7TQXcXidUDS5rm91MbIisjUvsPSiogTt212anKiDlDRNSIU+0yzvg7HIrUDQ==
X-Received: by 2002:a05:622a:180c:: with SMTP id t12mr24151786qtc.507.1640805963173;
        Wed, 29 Dec 2021 11:26:03 -0800 (PST)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p16sm15294493qtx.19.2021.12.29.11.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 11:26:02 -0800 (PST)
Subject: Re: [PATCH] mac80211: initialize variable have_higher_than_11mbit
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org,
 nathan@kernel.org, linville@tuxdriver.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20211223162848.3243702-1-trix@redhat.com>
 <CAKwvOd=dLjMAim_FRNyWegzEjy0_1vF2xVW1hNPQ55=32qO4Wg@mail.gmail.com>
 <b3ef8d23-7c77-7c83-0bc8-2054b7ac1d8b@redhat.com>
 <CAKwvOdkUQARWd7qG_hkUJYuVcvObMYTif_HDSEmJ5mSXP6y1=A@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <3db47d49-68fb-c286-b237-bfce1cb0ff08@redhat.com>
Date: Wed, 29 Dec 2021 11:26:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkUQARWd7qG_hkUJYuVcvObMYTif_HDSEmJ5mSXP6y1=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/28/21 10:55 AM, Nick Desaulniers wrote:
> On Fri, Dec 24, 2021 at 6:01 AM Tom Rix <trix@redhat.com> wrote:
>>
>> On 12/23/21 12:30 PM, Nick Desaulniers wrote:
>>> On Thu, Dec 23, 2021 at 8:29 AM <trix@redhat.com> wrote:
>>>> From: Tom Rix <trix@redhat.com>
>>>>
>>>> Clang static analysis reports this warnings
>>>>
>>>> mlme.c:5332:7: warning: Branch condition evaluates to a
>>>>     garbage value
>>>>       have_higher_than_11mbit)
>>>>       ^~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> have_higher_than_11mbit is only set to true some of the time in
>>>> ieee80211_get_rates() but is checked all of the time.  So
>>>> have_higher_than_11mbit needs to be initialized to false.
>>> LGTM. There's only one caller of ieee80211_get_rates() today; if there
>>> were others, they could make a similar mistake in the future. An
>>> alternate approach: ieee80211_get_rates() could unconditionally write
>>> false before the loop that could later write true. Then call sites
>>> don't need to worry about this conditional assignment. Perhaps that
>>> would be preferable? If not:
>> The have_higher_than_11mbit variable had previously be initialized to false.
>>
>> The commit 5d6a1b069b7f moved the variable without initializing.
> I'm not disagreeing with that.
>
> My point is that these sometimes uninitialized warnings you're
> finding+fixing with clang static analyzer are demonstrating a
> recurring pattern with code.
>
> When _not_ using the static analyzer, -Wuninitialized and
> -Wsometimes-uninitialized work in Clang by building a control flow
> graph, but they only analyze a function locally.
>
> For example, consider the following code:
> ```
> _Bool is_thursday(void);
> void hello(int);
>
> void init (int* x) {
>    if (is_thursday())
>      *x = 1;
> }
>
> void foo (void) {
>    int x;
>    init(&x);
>    hello(x);
> }
> ```
> (Clang+GCC today will warn on the above; x is considered to "escape"
> the scope of foo as init could write the address of x to a global.
> Instead clang's static analyzer will take the additional time to
> analyze the callee.  But here's a spooky question: what happens when
> init is in another translation unit? IIRC, the static analyzer doesn't
> do cross TU analysis; I could be wrong though, I haven't run it in a
> while.)
>
> My point is that you're sending patches initializing x, when I think
> it might be nicer to instead have functions like init always write a
> value (unconditionally, rather than conditionally).  That way other
> callers of init don't have to worry about sometimes initialized
> variables.

The variable is passed to only to the static function ieee80211_get_rates().

Tom

>
>> Tom
>>
>>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>>>
>>>> Fixes: 5d6a1b069b7f ("mac80211: set basic rates earlier")
>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>> ---
>>>>    net/mac80211/mlme.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
>>>> index 51f55c4ee3c6e..766cbbc9c3a72 100644
>>>> --- a/net/mac80211/mlme.c
>>>> +++ b/net/mac80211/mlme.c
>>>> @@ -5279,7 +5279,7 @@ static int ieee80211_prep_connection(struct ieee80211_sub_if_data *sdata,
>>>>            */
>>>>           if (new_sta) {
>>>>                   u32 rates = 0, basic_rates = 0;
>>>> -               bool have_higher_than_11mbit;
>>>> +               bool have_higher_than_11mbit = false;
>>>>                   int min_rate = INT_MAX, min_rate_index = -1;
>>>>                   const struct cfg80211_bss_ies *ies;
>>>>                   int shift = ieee80211_vif_get_shift(&sdata->vif);
>>>> --
>>>> 2.26.3
>>>>
>

