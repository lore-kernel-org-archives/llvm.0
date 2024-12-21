Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E01C5F1F
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734813733; cv=none; b=ODS1+64weXIfMQy5NCc99nOnSZxfzFSiy6jWgjNwmcqLuc52O/TqYynPwiWk1ZyAYn1hdDFkq7e0nMJvi6cq+YR/eq4bfUcjxsljcoC6gVCzJc7U6WHuK1v8EFCErfxN1uB5IW9iwgLXrOfMsdMUip3YUsm/vzktMfj923SJ+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734813733; c=relaxed/simple;
	bh=zrK2emgdHzKknFIZxQy1Fo32VgkP0x2vTD7bQVrCQdA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Mi7PBhTq14u0XCNtkz1C4NGVOXZdxJ3sU2ng9yCyFurmR+sG8fWydha6DblwPGReIFiGbdCHE+5RQ6BxmtmKRnSvsLFj6sYa2jc1vLLJS7t1EmTIylj+kWKoM993ViMghmklMXQ8gQlspe20nJ5VjQxpnFKylKC//tCr/vW9H8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NDWoxYg5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NDWoxYg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734813729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hSUiJ0yYY7i1pBIta7xM78HTs25VB/DEyRnymoMVWfo=;
	b=NDWoxYg5zbwggFVbPWbG3ZZeM3G9hxBSsmLdCS9d+rZhUcGsI7iFVwpQE5Qa9B4RjL6iOg
	O50b6d4gMNcSTER5LrHeMR8ZWClE/MHiL+CYaU1vdhqpRx0tY1Yg2UdmAD3HBCd97Sj5yY
	/nGsUyY+UINa6S6KhfB+nX+//2Ou1gE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-OqcWSQ-0O9idcsVIcs-pIQ-1; Sat,
 21 Dec 2024 15:42:07 -0500
X-MC-Unique: OqcWSQ-0O9idcsVIcs-pIQ-1
X-Mimecast-MFC-AGG-ID: OqcWSQ-0O9idcsVIcs-pIQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 615FD19560AB
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 20:42:06 +0000 (UTC)
Received: from [172.64.13.20] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A02CF19560A2;
	Sat, 21 Dec 2024 20:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc3,
 upstream-mainline, a016546b)
Date: Sat, 21 Dec 2024 20:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <32346.124122115420700267@us-mta-283.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cBqMYJYDzfjnvneDtVTPOPDr1RCU5vZpm_kO-awgTPA_1734813726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.13-2' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1599066813

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599066813-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1599066813-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599066813-x86_64-kernel
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

