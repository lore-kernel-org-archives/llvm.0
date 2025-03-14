Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211011D5CDE
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741953730; cv=none; b=b2QJzWGDl5L5PYgTxJmq3JJ+MPnFmgTLfuzQyD+oUSm3LRtclQKWpPB/CQ4M6Vcd+PkMD/a9CFas7LwwWswS4hTv+id5tyOdxwkDJ/RUt2+90yNZaUskJnzzOt16LNO3/qW24+QLCqLF97sTqYFdJC4AEhUqNnpQ2O7Tw9hOsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741953730; c=relaxed/simple;
	bh=vZTAMZBEG/rbeaF1T7om1L1QVncNPz3BWkqix+E02po=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NFA/3IeTficSZsDB+t2Y1hZE64N2X9ubG+c7nReAsDprDaTHZPHH/wJgGtph5X6Mw/igkiPsZO4ZpAPNxSf70uvZ00gTDT3qcdHjErTJH1/2fI7cHbZNRKPvMqZrDBH6o69SyHBNdHGR6moQELW+vrGw4Iu3oLf0DMwqL9RufWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYOgWPSC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYOgWPSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741953728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y77yWuyEtcqk7Zjva9Sjt8PVb0rPAiWbKBpcLY8J3a4=;
	b=fYOgWPSCNlPGtn8qjdOMnwnIFOVLeS+FS6tzo0VR0QHfvywJw3E3DvP4MD7iBLTzQ98YuL
	PYDFCC/ZGlaOVMndDp5hljrX0JquLnUcUsn98CJUUMJdag/BMXaKGIQAdHjuGII2KOwCMT
	+zBiNN9EJtsXwR17b652DF8Jq5P8c70=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-rEUrcmntPlWudn5giBlktg-1; Fri,
 14 Mar 2025 08:02:06 -0400
X-MC-Unique: rEUrcmntPlWudn5giBlktg-1
X-Mimecast-MFC-AGG-ID: rEUrcmntPlWudn5giBlktg_1741953725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7585E1955EBA
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 12:02:05 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C22B300376F;
	Fri, 14 Mar 2025 12:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, 695caca9)
Date: Fri, 14 Mar 2025 12:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <78684.125031408020602398@us-mta-627.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: un6FosVuPyd9DZVMSlLrx1s5dTPnEQX3g__onSjXIbg_1741953725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'leds-fixes-6.14' of git://git.kernel.org/pub=
/scm/linux/kernel/git/lee/leds

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1716520302

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1716520302-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1716520302-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

