Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513051FF7C4
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282401; cv=none; b=V2TEBQ4+qG6ZHbGkgKzh/viKa1EZ260WHUu45xH3T0tkQ/M26Gbr8xdfeJ1A1D3U1Wo7GDIOQspToS/VgC1Hboh9yO4vwpzsx4+JRO2eXXc3UjTX/07YHeZJS9XFcHxpeNOWcfrjEBA6sEAD60wE6mPtzgd/oA5O10VrIhQ7Xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282401; c=relaxed/simple;
	bh=MUe6wbg1EYAyuaBAVtfZbXFOHBTpqqF4HEqn8ZHWq0g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Pb7GhMUEzXxPPVlJEVml1NMc8qzp0Xbn8pjW4h2eJck+7fEkEtheeKmEVjBlXjiy92cZH+N9Kml1RAvDqtGwH44vdfsHeJ+xy9X2OuuWr4QXTROVPsiW6ZrTvz9/Mx/WtXwb1U91f6CEUmBqdC+J1Uc9RHK/vW8F98RDHFK8DDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5BHUOI9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5BHUOI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741282396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PYhWvsWnrLshO+uCczO0mLVBhlq3tltTfFR27ICVXak=;
	b=O5BHUOI9eHic0LxqZM0pLMQkUOZQhE1/q/EWP23K63YWoj2YUQpueobUPVBoS5pCpyzYGW
	ZCO8isv7Me05cUK3fmXrrYzrjix/0LWoivrsbpMnPs8ciqknCNB8J7yXUVcFrUWR/7l8MD
	VVJfufs7bryqbIAXIMtL1a+P6r1egZM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-3QkRFaKKO0qanecQuNq-oQ-1; Thu,
 06 Mar 2025 12:33:15 -0500
X-MC-Unique: 3QkRFaKKO0qanecQuNq-oQ-1
X-Mimecast-MFC-AGG-ID: 3QkRFaKKO0qanecQuNq-oQ_1741282394
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DED918001F9
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 17:33:14 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A6201801748;
	Thu,  6 Mar 2025 17:33:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 848e0763)
Date: Thu, 06 Mar 2025 17:33:14 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <36503.125030612331500829@us-mta-169.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0vJY2A1xhjevwLaf7MCC164EsJoNkI8sI27_zyr-z4_1741282394
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hid-for-linus-2025030501' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703363503

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703363503-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703363503-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703363503-x86_64-kernel
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

