Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628942A92
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185129; cv=none; b=eg2ykrCMOW5sJJI58nS33Kiyrm6bowHO+WzcFNUuk/RzgM9QLQKH4p7zFfF4gAcCeJdQ7duyqFt+Qr6Oc6TsuqlWameTQYpYd3y2ShdAmxePM4Fp9GBmVkEBPgkMKJUMBFMhq27ykj8b21PvHFJ97geLYJ40Oiha/4hxbm2ljLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185129; c=relaxed/simple;
	bh=saBbaBKpp7Z9iZYa8pa6Qm+nwdf12KH08732cPT3hbI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=juNABCGW+UHSQQLK41Indg4pLdZ0Ze2z8Hw7Ah24ZBOxAiLDbpmtzzOlp76FjntllKy0D5DMrdm/CP7kKT9Uw/7X5rXfvxf7Z3fwJweAOLTHaY4RsgVNSnJCmQQ3BfOsTUDysRYuHsv0lSSlXatS8WiOXIiWd2p9keQ8rHwnPMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUbeAuCn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUbeAuCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738185126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xRq4lXoUjwGssrSA40u0I87Q/N8XaZ8i9jFzM8k076E=;
	b=FUbeAuCnSXkTXRAzgW8uEFXYfCGHG/7k782tB90IpcgYvsgmdqZOamQbHt+xD+G6hwBGmd
	PEBASyDGgTDRVs2Ohs5DUis9eDwT/qbNkE6+JyiZZ7uQeBWmXu1ifhUSNetCvY+14UWUa7
	d6uFbFnf523s8QRlqq7mjSiJRn8IQog=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-gphL0hajPSCNg9RReUPSXg-1; Wed,
 29 Jan 2025 16:12:04 -0500
X-MC-Unique: gphL0hajPSCNg9RReUPSXg-1
X-Mimecast-MFC-AGG-ID: gphL0hajPSCNg9RReUPSXg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFB22195609E
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 21:12:03 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3AE4619560A3;
	Wed, 29 Jan 2025 21:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, ebbb8be4)
Date: Wed, 29 Jan 2025 21:12:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <17766.125012916120500129@us-mta-682.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yMXfyJToRLKp8hzHeWIw_SchXv88CX2D7NRfo0awp28_1738185124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'regulator-fix-v6.14-merge-window' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/broonie/regulator

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1647388542

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1647388542-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1647388542-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1647388542-x86_64-kernel
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

