Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756953;
	b=Av2iylzxulXJlqLAp0CiWjOr37d/b4WNong7kp7njqWuvN2MLJS7C9V+zoj7VhvGYmWr
	 s+bzl/xrtJSniUxKC1jpegMWvGjru5l+KWwImP+Vg7eJg1pXVub2iqs+HiElggwbM+Y/7
	 4ydm6Pvwf5YnPSxGP7sVw6ozZSCP7DlJEB1D8+tmWdMgOnupDFGYmQPivI0GIM6TLOWC7
	 x8O0agXMeR2/9+3EkU4sYaoeBKXXRVm2wifhXRVKS8kfQuUjl9VXxOrjxbkoydDaTJ+Om
	 /gwbuaGDtsNDUViV/ZGfAN1zx1qAHjbtyMkjHk7pOHlI67rDduRs9DcPvKdiygh3ZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B9+nhlrF2Dcltc/b/gA0HI4sU+fSxvFt8AwHcya3lHg=;
	b=3rCQj3AdzvRW5LQCMsEpHBTHLjY0o127VLXN4EhqeqAAl2SPJ8+zZKGuJp48qDU31Esl
	 u0otHDyFWRz6m9X5rcxMb7d14GGRV5MaRfptG60UlhOxxchy6rcGlShBVKFf1XpWyeKyr
	 1piTPwXPF5Zdh5kf0Q/vOq02owjIEC+6/tEK9WiRuzyebiEtwS1fRCQbuL2FwdtNaZJOl
	 oDwPVPkXJ8aaDsn5XcCIOpXtUHzFIbi0ZxA4o2rhg0uvrzjwxAw+mkx9h+Ke1wIBCA1nE
	 8K9KYO6ecvxHqNmgShvFmsyCCqwG0Lykikpj2i3apfl3Dvx1MV0dQCcZMJWsVkKH7tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WmgCd1z2;
	arc=none smtp.remote-ip=91.218.175.104
Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28797606A329
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 01:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28797606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WmgCd1z2
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ly87kVwc8IX3qQC1upPNiV4ixKwflXWdxxSQPtJr530=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756950; v=1; x=1794361750;
 b=WmgCd1z2xEwibpWazqwjfNFUMb/ti3JB4RI5g7fyRZsn46BHNv976oy8pudR2GVmIAJJvRtf
 TrX/RUMKekNCUJ4umRhO8sDe3MsN0lQ17l2YjLPHJ85Ak4zEfIrw99VzIKMHFgKZKG5V32FMRE8
 5KvQHTjKsDF3UPgEh6FVAgSE=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id bf8193c6aca9eaae;
	Wed, 04 Nov 2026 01:49:10 +0000
X-Mizu-Trace-ID: bf8193c6aca9eaae
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:49:00 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next] selftests: netfilter: nf_queue: drop the no-op
 loop initializer
Message-ID: <auqPDIM0z0MbuBhS@fedora>
References: <20261103165419.687806-1-sashal@kernel.org>
 <20261103165419.687806-5-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103165419.687806-5-sashal@kernel.org>

On Tue, Nov 03, 2026 at 11:54:18AM -0500, Sasha Levin wrote:
> The out-of-order verdict loop starts with "for (ooo_count; ...", and
> clang warns about the unused expression:
> 
>   nf_queue.c:354:10: warning: expression result unused [-Wunused-value]
> 
> Leave the initializer empty.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> KernelCI's clang builds show this warning.
> 
>  tools/testing/selftests/net/netfilter/nf_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/netfilter/nf_queue.c b/tools/testing/selftests/net/netfilter/nf_queue.c
> index cca6c3cfa9e46..bc0b2f601a0a4 100644
> --- a/tools/testing/selftests/net/netfilter/nf_queue.c
> +++ b/tools/testing/selftests/net/netfilter/nf_queue.c
> @@ -351,7 +351,7 @@ static int mainloop(void)
>  		if (opts.out_of_order) {
>  			ooo_ids[ooo_count] = id;
>  			if (ooo_count >= 15) {
> -				for (ooo_count; ooo_count >= 0; ooo_count--) {
> +				for (; ooo_count >= 0; ooo_count--) {
>  					nlh = nfq_build_verdict(buf, ooo_ids[ooo_count],
>  								opts.queue_num, opts.verdict);
>  					if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
