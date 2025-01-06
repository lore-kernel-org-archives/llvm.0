Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EDE360
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193188; cv=none; b=SMDS2/5509SjuiHAs7OLsB9zXfcIqkkL8oTI9kHOMnw4tPFim9gjOBj6wbTfmo16VFXo9mBKMbOh3Kj0VhLXFQYPwTveQYFxyCzqlMqa9QsSwsqkYfkLNoOot1jYZTT6MalrN+p6FR+LzjRuj9yRChxxFcLEEbffh2VghXmbBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193188; c=relaxed/simple;
	bh=ktR4U64PaHkHkYtT6uKkFaTcngP2uE5NgXFG6OFMVM8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MyiSg1P6nfqQPPT7rwnkhyw12FfKIUiNAFa0c+VgaMHdoG++QDj+O3fXCPyCbhO5T5Qbca9+4hJJUWPQGulYq4ZXncv9n9x6G+36HUz3quNsu0dpQtQsE0bS7SP8xtvwOFgsE3X6i3JOnbLJX6If1/iIAQDbVaW94EiwGf5whrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vkj9LwBc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vkj9LwBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736193185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=meLwZ0iDlGuX8I2h1Oc9kfUxKA5axabdPkGsOE+Xv2g=;
	b=Vkj9LwBcPMGP0U9P84JGDOysG+1hTu9oVP42aWlAQ8B0rJ4pDykDqiZsRXifsfSEHOHH/u
	FEO5rmbnT+ciRWm/rO38L2l57Klhhh3QbIqY9Rpj/d7d43r0krNVvQq9OxQ6dG9vYyCNtk
	wsh1/lgXHQ5pcsQ9KFyv/q9ToyusWWM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-SWfqT0PPMISxmwyd1NsUdg-1; Mon,
 06 Jan 2025 14:53:04 -0500
X-MC-Unique: SWfqT0PPMISxmwyd1NsUdg-1
X-Mimecast-MFC-AGG-ID: SWfqT0PPMISxmwyd1NsUdg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E8BD1956046
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 19:53:03 +0000 (UTC)
Received: from [172.64.11.15] (unknown [10.30.34.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 374113000197;
	Mon,  6 Jan 2025 19:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, fbfd64d2)
Date: Mon, 06 Jan 2025 19:53:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <02532.125010614530400831@us-mta-472.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NlTGfToIp7Pn027Prcxt1sBW1Kl6LH-Ku23cRb2QTyg_1736193183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.13-rc7.fixes' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1613417307

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1613417307-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1613417307-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1613417307-x86_64-kernel
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

