Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EA14A614
	for <llvm@lists.linux.dev>; Sun, 12 Jan 2025 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736725388; cv=none; b=bA98/lvL+vokdfZejT/q5ZS+tKj+gY6PfU1Kga13BoR4WtgbydEESVEBZQMgNWHXoni2Chv2Ck2yb5c5TqFJHP10SsVmagABIV65MevxmXf74466A8mpuMfAiZjQTwtqhkfQIaxFkBmimnhHLKQgJE3vVD/5y52sBj+yA7AfXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736725388; c=relaxed/simple;
	bh=ueChQ3wHDbC9xKwnNAzvfjSbCUlcWrr7QSkJHutjSVo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sGEtMXOHVgmv+6ocC92k98fJ/7Lx7WC+rxbfIELlOOKym1wch6jdgTckrKRAv9TAdN9HDRZJjdzTFVb4YdFw//694kI+/hb/g9qzFVJMIHI7k6doge9MRSfAvRy8MdHRRTj90AOjvnId4IxYLHxH//RCul5NlE8BX8MQWltUcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BeVsWdjp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BeVsWdjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736725384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIzp74n44Om/yOVjkP2Es7KK8RHIXAM79ZHZ+c8sl+4=;
	b=BeVsWdjpbkys9j/A+aoPmvFXhNp1Ah0Zs8gITDz86IeRZVMfEpy9NypeYT8YojWVoJpDB7
	vvyiBzHKa2SmVIiRNMRcNApWmnrrbEPNQiYw624kxXEpQaYekF+7T4cMi678TmEyK263y+
	xf2rdCkEUgtCMnHcb6gjgQaxS5WSCu0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-rFCl1sTSNK2FHAJznCfwTg-1; Sun,
 12 Jan 2025 18:43:03 -0500
X-MC-Unique: rFCl1sTSNK2FHAJznCfwTg-1
X-Mimecast-MFC-AGG-ID: rFCl1sTSNK2FHAJznCfwTg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 38A9E19560AB
	for <llvm@lists.linux.dev>; Sun, 12 Jan 2025 23:43:02 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B215819560A3;
	Sun, 12 Jan 2025 23:43:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 0cbe1047)
Date: Sun, 12 Jan 2025 23:43:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <86830.125011218430300168@us-mta-659.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5qMw5PiPwTxJtjtrbhRFvAvA6h-83JH29DHaEUL0hs_1736725382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'char-misc-6.13-rc7' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gregkh/char-misc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1621762544

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621762544-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1621762544-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621762544-x86_64-kernel
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

