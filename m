Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04E2701CB;
	Thu,  7 May 2026 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182309; cv=none; b=LOhDIFxzbKr82Vdac4yzV2bcmJVy0P4hkz5UMqAuCuBET6/pFTksGyGvLfKcTfXlwd/DLT8hUr3uxzJthObfMV06Wspfx+ycBqgH+SB9fhVha+twOdm4HIWO6R/4Nq1WoYvdnvAWGSzo5xB5Fb3+fPsw48E0IaGPjEI9Z2B/p2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182309; c=relaxed/simple;
	bh=iedx6vYTOt6EQ+8biHjoci8/Z1oBNpEcQ0mQDe3TfJg=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=Vx1S7dHDDBNJwEjQZvuieSM1n9pwrMIcuz0272/2Q0fsWeNf2gvMNPZ3FeerJagNqnZlCjY02TG787ilglJWdqCb/Qc9+NSu3ibBLAQSfNMbEzs4AZDdXoirtBBq31KsRulNnirqf1M9nFu/hmYzrwKqmxiwqqR7kR5h+l4jjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=Xw51TXRF; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="Xw51TXRF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:To:References:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=94wceeqnt7neE63vyZ5Q6+cgb/PI16Emv45q5Kr8B34=; b=Xw51TXRFxpiiaNa4e3ypVKyvTV
	1vNul5wUOuE+zZ/J1TaNaL+DVE62an7G8BSqfK9HosK41susXnCkmKEZ7rpsay/ds4KflF/qepnel
	V03U4lRwthP+RGlCllDQyIjtZzM/s5wy63HfFIJxSvq6pamAf/UNLwzYAFUICrUZubhC2YsQ8cFi0
	rz3SUX00/2/b1i4ayVIg+D+gasfV03stR/JjyUNOsbUNWT+37iKwTfppU+tQOZWbaJF5ry94VCk/b
	b2XPfm7/5xpi4T1TNO72g9hW6QRMu4GjXqMN802BJKDTThKs4BBqChgsLnM3JtbMYGTN0H+/mPo0j
	oJH+O87w==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1wL4Rd-0000mr-1b;
	Thu, 07 May 2026 21:31:37 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1wL4Rd-0000gn-0J;
	Thu, 07 May 2026 21:31:37 +0200
Message-ID: <98f7c318-c571-4204-a4df-f70221ef8c39@computerix.info>
Date: Thu, 7 May 2026 21:31:36 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: linux 7.0.4 + clang 22.1.5 with thin or full lto still fails with
 objtool error
Content-Language: en-US
References: <3138b173-cdad-4cb6-bb10-98d164513e6b@computerix.info>
To: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, peterz@infradead.org,
 linux-kernel@vger.kernel.org
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <3138b173-cdad-4cb6-bb10-98d164513e6b@computerix.info>
X-Forwarded-Message-Id: <3138b173-cdad-4cb6-bb10-98d164513e6b@computerix.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27994/Thu May  7 08:29:28 2026)


The error I reported for linux 7.0.3 and clang 22.1.4 (see below)
still occurs with 7.0.4 and 22.1.5:
Compiling the kernel fails in the "LD vmlinux.o" step with
"vmlinux.o: error: objtool: bad .discard.annotate_insn entry: 
599 of type 8"

This time, I reproduced it with the vanilla kernel,
not the gentoo kernel, so there is no gentoo involved in the build.

It happens with both full LTO and thin LTO, only no LTO works.

My kernel config reproducing the error with vanilla 7.0.4 is in 
https://bugzilla.kernel.org/show_bug.cgi?id=221460

-- 
Klaus Kusche

-------- Forwarded Message --------
Subject: 7.0.3 with clang 22.1.4 and full lto: objtool error
Date: Mon, 4 May 2026 20:46:50 +0200
From: Klaus Kusche <klaus.kusche@computerix.info>
To: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, peterz@infradead.org, Nathan Chancellor <nathan@kernel.org>

Hello,

with clang 22.1.4, I get an error in the "LD vmlinux.o" step
(full lto):
"objtool: bad .discard.annotate_insn entry: 609 of type 8"

Same kernel & same config compiles and runs nicely with clang 21.1.8.

I've attached the kernel config to
https://bugzilla.kernel.org/show_bug.cgi?id=221460
