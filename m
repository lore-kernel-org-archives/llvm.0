Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9892CA1
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 18:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FFCC53FCC;
	Tue, 30 Nov 2021 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638297133;
	bh=CL1JsLrNj91T3hCHEOM5FMzrebrCpdWGN18ObZv1xTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQyxbDSpvzOaXQ8X+NNUkxy4HV70UxWQj7s8ogxPwUEvJrFUTTL1OiSwtjqKUO8wF
	 aT0DJioso0azxmIZbJ/vjQhY73dzrlyu/uzLFAtZN1AKINQbDWALKjKQn/j4jVD1Jk
	 99nvJ1PYRQ2LGa+DI+xgRlZRlTtKedmWVJgSPa/2Jje5usANY7LeB+RgreL06EMgjP
	 ePXRTt53WbjkhPiFRLhQ5RPIrRvo1on+jcyePk+i6e+CXR7ss9892UGkD8vVubNVAl
	 MVruczNirAqN4C542IGtqgIVYvEKblh9FY5RTypY6WSXxJKHP/FwVBqazhQkb4mc5z
	 QsleeK5v8BPiA==
Date: Tue, 30 Nov 2021 11:32:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Finn Behrens <me@kloenk.dev>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5] nl80211: reset regdom when reloading regdb
Message-ID: <YaZuKYM5bfWe2Urn@archlinux-ax161>
References: <20210526112418.cdwkn7ed4twctimc@imap.mailbox.org>
 <YaIIZfxHgqc/UTA7@gimli.kloenk.dev>
 <YaZLEEj2pUU/DhZD@archlinux-ax161>
 <6BAD2771-7C01-408E-98BE-76A1CAF3A810@kloenk.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6BAD2771-7C01-408E-98BE-76A1CAF3A810@kloenk.dev>

On Tue, Nov 30, 2021 at 05:50:58PM +0100, Finn Behrens wrote:
> > On 30. Nov 2021, at 17:02, Nathan Chancellor <nathan@kernel.org> wrote:
> > On Sat, Nov 27, 2021 at 11:28:53AM +0100, Finn Behrens wrote:
> >> this reloads the regdom when the regulatory db is reloaded.
> >> Without this patch the user had to change the regulatoy domain to a
> >> different, and then reset it to the one the user is in, to have the new
> >> regulatory db take effect
> >> 
> >> Signed-off-by: Finn Behrens <fin@nyantec.com>
> > 
> > This patch as commit 1eda919126b4 ("nl80211: reset regdom when reloading
> > regdb") in -next causes the following clang warning/error:
> > 
> > net/wireless/reg.c:1137:23: error: implicit conversion from enumeration type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum nl80211_reg_initiator' [-Werror,-Wenum-conversion]
> >        request->initiator = NL80211_USER_REG_HINT_USER;
> >                           ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > 1 error generated.
> > 
> > Should that be NL80211_REGDOM_SET_BY_CORE (same value, 0) or something
> > different?
> 
> I think It should have been NL80211_REGDOM_SET_BY_USER, as the reload
> flag check is currently implemented in the user hint function. But If
> I see it correctly right now. We could remove the reload flag, and
> NL80211_REGDOM_SET_BY_CORE should work as well. As the
> reg_query_database function is called unconditionally there.

If you tested the current version of your patch and it worked fine, then
it seems like you should just revert the addition of the reload flag and
change

request->initiator = NL80211_USER_REG_HINT_USER;

to

request->initiator = NL80211_REGDOM_SET_BY_CORE;

given that is what is happening right now. The warning is basically
pointing out that reg_process_hint() is calling reg_process_hint_core()
instead of reg_process_hint_user() because NL80211_USER_REG_HINT_USER =
NL80211_REGDOM_SET_BY_CORE = 0. Hopefully that makes sense.

Cheers,
Nathan
