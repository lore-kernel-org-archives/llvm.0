Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086941373
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 03:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738033390; cv=none; b=brecBHHkk5juF/uzCvAGsUVJale2MYgI9f4RYgnJJ5qwUzBfHgua2tbUyvW0rp0qxnhkEyLf5RKr52EEu1xG7Clrp+lSOzU0gE7VS3shW3Z0ulrvCkGQibMSnamSmUG012fvFt5YhRsZxwiuG1G8xiCK1KWNjmfQjm67EhzV8Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738033390; c=relaxed/simple;
	bh=HVGHN+HZsK+tnvhshRdw1gn90eBkgYtxmvlnj+NN+jw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GPHmLIx5RP2RohEtqwSxZk/0SkhcOrJLO3KSgc9D1CWUdQ5Ev4c5L/5d71Qh4IUhISGtGaTxf8s9qS2PK/qfjVhduG0LHD8XVClHMxea8k28SBp1U++aQH50oQXfYvYMVRbD7mrvmpU+k52MyNTEJk9SZJrILxib0Fx6o1tcKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMLC+Voh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMLC+Voh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738033386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wQQRwdIRLsB8Rfe2OLhaK3tqeDy2JxRmyNjQHUx/aZI=;
	b=gMLC+VohaJL08Ds0hKj50g2wircRBRpChZXZApq9Enj2UdxRD+SZYAOUYGGuEYnYRCrJUI
	xGfXRgi0ui82mt2rwOvFEVRDUOWQDusgCCZ4cxTMFAjFivJ/leHuBiHGE/JKxmp3y7JSlA
	j4qRV2J45vadpBwoN/ge3SVQKeFRHDo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-xFOe8DdqPMOp5-gQqd0opw-1; Mon,
 27 Jan 2025 22:03:05 -0500
X-MC-Unique: xFOe8DdqPMOp5-gQqd0opw-1
X-Mimecast-MFC-AGG-ID: xFOe8DdqPMOp5-gQqd0opw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 342371956052
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 03:03:04 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4B4830001BE;
	Tue, 28 Jan 2025 03:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, f34b5805)
Date: Tue, 28 Jan 2025 03:03:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <11871.125012722030500203@us-mta-519.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MQU5wrZywNnEtEbn39gaaOOlbeATxfOqM3_2R67evtY_1738033384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.14' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1643668629

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1643668629-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1643668629-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1643668629-x86_64-kernel
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

