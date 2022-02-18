Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAD4AAF
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Pbdl+NjCsDO0eLase/4uSbewdLL/4qAMXdwzMo6Whls=;
	t=1645204074; x=1646413674; b=QK4zknledK3oXoDrAUe5Dg9L5EFzrFkXUBOLB628UNc6sDO
	wRcmSfwcSMiwqFr/GLcKYmANnKSjlNn0O92J3JITO7O5up4xFW80LprXNIzoANlJhkswVaV6ViHp7
	UDBlVbs9J9xuqm1wYnJ8M64JJZDEhlTgr5MRrwhaf2kGHMCR1zWlpZSNPuJ15N9mrku09mMfYNajC
	tjVJbPlk3jG8yTm4BLy1e5DAz5r66S9gZ9NG4AuAV/n7od+2EfIlmjCZbvMYnSAOtEi7R1zBFgVqw
	L8W1oUczj44iKFe6QfYyng2YaLCZHX9Qo5tud933Po4ynsKrc8s/QtyXPJUr7Pmw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1nL6TJ-002j4y-OA;
	Fri, 18 Feb 2022 17:51:05 +0100
Message-ID: <cbc4026aa94ff68e984743ef1666a6dd810c596d.camel@sipsolutions.net>
Subject: Re: [PATCH] nl80211: check return of nla_parse_nested
From: Johannes Berg <johannes@sipsolutions.net>
To: trix@redhat.com, davem@davemloft.net, kuba@kernel.org,
 nathan@kernel.org,  ndesaulniers@google.com, cjhuang@codeaurora.org,
 briannorris@chromium.org,  kuabhs@chromium.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Fri, 18 Feb 2022 17:51:04 +0100
In-Reply-To: <20220218163045.3370662-1-trix@redhat.com>
References: <20220218163045.3370662-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Fri, 2022-02-18 at 08:30 -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative problem
> nl80211.c:15426:6: warning: Branch condition evaluates
>   to a garbage value
>   if (!tb[NL80211_SAR_ATTR_TYPE] ||
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> tb is set when nla_parse_nested() is successful.
> So check.

Well, it's a bit annoying that we cannot express/check this, but we
already validated that it's going to succeed, through the nested policy:

static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
[...]
        [NL80211_ATTR_SAR_SPEC] = NLA_POLICY_NESTED(sar_policy),


Thus, it cannot actually fail. I suppose in this case checking for
errors doesn't make the code that much worse, but there's isn't really
much point. Maybe a comment would be useful?

johannes
