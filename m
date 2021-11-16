Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BC2C87
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637098073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bG84hpn6W1Ce0UZLXpoqOhyDwS32BUv6DCCBEZ7b4bY=;
	b=hHVkTGCMCsAwFvx3SZL638dnFrHP8o0ZackBUj5dveR+eZNkdf2S6EcDEGRYdGfsphaf0r
	4xdzytWBDYaZWA8blezADyXpMeao2tqpEFiLNclUiSkVwcWac05leFOVcuR/fHGRltiLbG
	hsk/dfEyu29/BxBXzj4pFx9IJpgGxNo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-sFF24abiORSa_N4dWkpr2g-1; Tue, 16 Nov 2021 16:27:49 -0500
X-MC-Unique: sFF24abiORSa_N4dWkpr2g-1
Received: by mail-qk1-f200.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so269393qkd.0
        for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 13:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bG84hpn6W1Ce0UZLXpoqOhyDwS32BUv6DCCBEZ7b4bY=;
        b=0qXj0C9LdCd3LU4jy9miHBYOA8ZqtFUuLq3H8+v/sQjn4DKEgeakirVAEe7wN8mqW7
         WnLjjuVhwRbpAab4XD8GpOLyS+9sYijSBEz3/d6PNCTDgVBzgMF4diuHxJJsPxL5Bztb
         wNrq3Yg6s9uumkei2E59Zjhy+xtN8oBEXMYb018pCHnB3PQPOyh1JxVAx6Cg/pPFIIhb
         9KVQv2C2mpS3flRnVkarThdeV9ut6uVH9wDMav36YucgLfALV7nuUL04GeiioxovRe+E
         xwrY3Il7lj7hclFi4Cor2u+P/x5fwVTgZaXEiEsHOvBT31QNEaP2ZhGFBiDYnm1NnzNm
         NaEA==
X-Gm-Message-State: AOAM532Ph/r0yn0gpxQAHFXF4q5GHRP74sot919Qpcn5tYkIXfTxN1WG
	cN+9PF2qYV2amc6gw9a1gyTXJpNwz+vYGZvwyJh9fY6aw6sIV1e66vLB9EFA0JHTB3nZgUC2EHp
	4ohDZG8LAsgqaFA==
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr11562275qta.271.1637098069422;
        Tue, 16 Nov 2021 13:27:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0St0o43XIqlBNq/4XHEmss+fFXxHlpXC9ZaRAk6a4tHpGQiJkuUzVvVz/UKpde8JY+mNI6Q==
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr11562242qta.271.1637098069203;
        Tue, 16 Nov 2021 13:27:49 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id j22sm5655991qko.68.2021.11.16.13.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 13:27:48 -0800 (PST)
Date: Tue, 16 Nov 2021 13:27:45 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Peter Zijlstra <peterz@infradead.org>,
	David Laight <David.Laight@aculab.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"dvyukov@google.com" <dvyukov@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	live-patching@vger.kernel.org
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Message-ID: <20211115230737.27gqnzwvkaxoi7es@treble>
References: <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net>
 <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <20211109210736.GV174703@worktop.programming.kicks-ass.net>
 <f6dbe42651e84278b44e44ed7d0ed74f@AcuMS.aculab.com>
 <YYuogZ+2Dnjyj1ge@hirez.programming.kicks-ass.net>
 <2734a37ebed2432291345aaa8d9fd47e@AcuMS.aculab.com>
 <20211112015003.pefl656m3zmir6ov@treble>
 <YY408BW0phe9I1/o@hirez.programming.kicks-ass.net>
 <20211113053500.jcnx5airbn7g763a@treble>
 <alpine.LSU.2.21.2111151353550.29981@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2111151353550.29981@pobox.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 15, 2021 at 01:59:36PM +0100, Miroslav Benes wrote:
> On Fri, 12 Nov 2021, Josh Poimboeuf wrote:
> 
> > If the child schedules out, and then the parent gets patched, things can
> > go off-script if the child later jumps back to the unpatched version of
> > the parent, and then for example the old parent tries to call another
> > patched function with a since-changed ABI.
> 
> ...
>  
> > I don't know about other patch creation tooling, but I'd imagine they
> > also need to know about .cold functions, unless they have that
> > optimization disabled.  Because the func and its .cold counterpart
> > always need to be patched together.
> 
> We, at SUSE, solve the issue differently... the new patched parent would 
> call that another patched function with a changed ABI statically in a live 
> patch. So in that example, .cold child would jump back to the unpatched 
> parent which would then call, also, the unpatched function.

So if I understand correctly, if a function's ABI changes then you don't
patch it directly, but only patch its callers to call the replacement?

Is there a reason for that?

-- 
Josh

