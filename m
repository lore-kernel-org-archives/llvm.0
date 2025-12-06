Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B7B18A6CF
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765006989; cv=none; b=PjP6LIpioBYeb3BFPk7jusF9iy6z3wM7ZyszHszm5yCKsb3OARMw2zC58mFPjdvzA78ZNic+3huhoJODGIpo2EidrHDICNlDOVdbibuslMfuQWuCV0PpkkX6WxdW81IYUR+VeUPfaVl95xZmQdOEodpukv1KPtOR1JaPpMONrNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765006989; c=relaxed/simple;
	bh=zhCululu/oXTxXdNHoAmZX7YD66Aoz+5K4BaSMPLTdE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jJO3Z2Id6XisVjrJAL3d43BpGrJfn76p1BSM/N8pCr90lwheUkqV24+PU9NBShIS0yBx8uSuUR5HNtXeJkKgmDSQMH7XeBh5DVw6NsrQR8WZRryIrsHX3hcaMw2v90naTFJFPdntJj7RiRLj+nBHqDgn+rt/KZu0UNoK0htyxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=On76XZSh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="On76XZSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765006986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QH1N+wrrbpLaBZ3Xi8TqxYO3/WPGXx3S/d3ix97rEF0=;
	b=On76XZSh88caWzHD5L+GksIDop0+lbalw8yruNTThmP0JPBmUrSbNZ5YIF2mNMKi87Rzig
	V4OIYa99pPj7L7sAX5TQruEeEiteOzqQCh7iZok1/7JkkwX8+Id9LJOcrMBPNRaBX605tS
	hdFg2EMSfC8LTuHp8jaUtLJLDu8m8tI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-orqNstILNY6IHgGOh46Qtw-1; Sat,
 06 Dec 2025 02:43:05 -0500
X-MC-Unique: orqNstILNY6IHgGOh46Qtw-1
X-Mimecast-MFC-AGG-ID: orqNstILNY6IHgGOh46Qtw_1765006984
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 732BF180034C
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 07:43:04 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B842D3011A86;
	Sat,  6 Dec 2025 07:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 416f99c3)
Date: Sat, 06 Dec 2025 07:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <65687.125120602430500421@us-mta-399.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uri67UrhqhqRb-TbRFM_pteIgt4279l3jqqIfw2tXGg_1765006984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'driver-core-6.19-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2199536937

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2199536937_x86_64_kernel-debug


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

