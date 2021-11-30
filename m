Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C868
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 16:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA593C53FCD;
	Tue, 30 Nov 2021 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638288148;
	bh=64RAz2CqUQ1QEHCt+L9O5W/tNpPu0BSBDbOZVhu3//Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eo6OHzOon1ZkbYjVdWvSMF4atPZg51dk2jL8vjgZwUJOap3OIWAd22H/bivVQ1H+h
	 Sg+oNtPzIK9rBszlMfmb6COcL/NaDZ67jeeJW4g2eETHT6TvG4TK0odxIFmQM3s2kk
	 UYtpuKZt1VfpaS6qwDQ8KaoMgzt92lMpuCLk6slO4xwnrJbZUWSC4hvUFslMAePDNZ
	 BmAcnU2ephBRJYyCPilLDMbGFW1NNyFO+0xz7gZTeCWgCaKU+2W017QDG1VHuju61j
	 aMm3+KRcgweDnCWNt0MAUB0VdZPQ+s7gHgb4owan8ZmYwRcrxBH4LggRjzkflqKwmv
	 EFLDeM9Sfs6XQ==
Date: Tue, 30 Nov 2021 09:02:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Finn Behrens <me@kloenk.dev>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5] nl80211: reset regdom when reloading regdb
Message-ID: <YaZLEEj2pUU/DhZD@archlinux-ax161>
References: <20210526112418.cdwkn7ed4twctimc@imap.mailbox.org>
 <YaIIZfxHgqc/UTA7@gimli.kloenk.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaIIZfxHgqc/UTA7@gimli.kloenk.dev>

Hi Finn,

On Sat, Nov 27, 2021 at 11:28:53AM +0100, Finn Behrens wrote:
> this reloads the regdom when the regulatory db is reloaded.
> Without this patch the user had to change the regulatoy domain to a
> different, and then reset it to the one the user is in, to have the new
> regulatory db take effect
> 
> Signed-off-by: Finn Behrens <fin@nyantec.com>

This patch as commit 1eda919126b4 ("nl80211: reset regdom when reloading
regdb") in -next causes the following clang warning/error:

net/wireless/reg.c:1137:23: error: implicit conversion from enumeration type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum nl80211_reg_initiator' [-Werror,-Wenum-conversion]
        request->initiator = NL80211_USER_REG_HINT_USER;
                           ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Should that be NL80211_REGDOM_SET_BY_CORE (same value, 0) or something
different?

Cheers,
Nathan
