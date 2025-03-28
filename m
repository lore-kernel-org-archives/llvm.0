Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1971E51E9
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743202395; cv=none; b=F42aYitnxj41Kjd3tp1/aSQbBCOj3agoRTOHaACdtVHtPbMf1lWV4YkM7RiI0GVA/NsRWuRJQzykaZD/hOs8tdY7slLc+iq5DHXkCaYpupZ2/DVhwQEVln1/byFu//PW+x2x2T9RtMLu6NFblOyCk318IuMuYWsAjqDkdvh73WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743202395; c=relaxed/simple;
	bh=+32159J96t4VxrvQhSQK32E4Vr807AdCMnHZ1Y0hb64=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=StIgaQjhz5L2EwV9FFaBuSqWnMWy91RjVnx8WBcMSzVE/bUBLbUYIGQHVUXZrUp+iHe5QxvMLi/odXjxdDk2TBcxsr4wJc69h/YiTYR78oqPPm68XOryQZKGy2DHd2aa7gzmb0CusGbVjY5L8yCszfstLKZ/0wwjctvaOTlGeWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GByCmNpq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GByCmNpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743202389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xy3Q65jiLg2pOcqSUL1qRDRHB+qS+zvfHbQ5+Ql53fk=;
	b=GByCmNpqiqy+glnC3HmWlsh7y0VxSGQ16DE9q386/t1ck+AjkSk/SeJH7//OQb37O2Sw9v
	C6zNgVXe/0aXn2680+WKIdd5sOm6ZwX0cuMftY4t/pL+mlLmNhgLH1nMzxGYy3qpW1si8/
	bNmvM9muMtEVFubvA/rwJac+m53Uygc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-I2FxBGNZMBu5X28YV5vZJw-1; Fri,
 28 Mar 2025 18:53:05 -0400
X-MC-Unique: I2FxBGNZMBu5X28YV5vZJw-1
X-Mimecast-MFC-AGG-ID: I2FxBGNZMBu5X28YV5vZJw_1743202384
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9A3219560BA
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 22:53:03 +0000 (UTC)
Received: from [172.20.107.51] (unknown [10.30.45.88])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 356B51801766;
	Fri, 28 Mar 2025 22:53:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 15cb9a2b)
Date: Fri, 28 Mar 2025 22:53:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <36139.125032818530500897@us-mta-224.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qfREglNXQzGNsOKLTZGaAxn9cb_5biUu86RGEAxSHU4_1743202384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'tpmdd-next-6.15-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/jarkko/linux-tpmdd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1741062336

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1741062336-x86_64-kernel-debug


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

