Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115E1D63E4
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742984594; cv=none; b=AK3v1OuNcszF7xtvknI8U11VO4mqVXMDsTToIr8TWddF4//iaqxRkcrLnn9TqLbTM4XpyL3Tcq51YRG4oSFs+JVoXgcnqi1k4L9Vj6KvP75qf3ur6SrE3ZDL2bjK/by4mNCIHhiq1oh12+C2pUk3MySj92HbANvnIESQQsX6exo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742984594; c=relaxed/simple;
	bh=b1WuOtgq+K9qAIGbr5F4w9vP1xxuClvPE7zwG3tKnIs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MKkDrA5KjLe2+zPuspMEqee13wRAT5XvIW75zH7tyE+D0XEaVJBGcDljVxb7ZAQV8Puh2bXFa4zn/gzZRxB71gok9Ny6psQdJYnpOpsJlu50LEfel+B3rfDEXzdHSiI8mAtA5DnhEn0kGfXfnP+A29oNqBU13D3IB6XBUkmWED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxnopVGT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxnopVGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742984590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hYciA7o5YYVyX40C5Z7eNrYew8H6oVkrAD/FWfBHFtM=;
	b=fxnopVGTG5VQz7LLhS1anXPxSAPq5GoaeXypLYgd3rkQsiK6PSJRSEVzrFtLaQSkjgvR4C
	kBgh3GRPTt2/cgQMAP3/yfQtwpJQSyNaoYYIhOFCF7ooL69me/dmLLwFy7bgH0/Uug2B40
	bbE7htADFrecFfdyAeo6tGA7L0c8lsU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-INJRJMUZODKLyKi5g4G--w-1; Wed,
 26 Mar 2025 06:23:09 -0400
X-MC-Unique: INJRJMUZODKLyKi5g4G--w-1
X-Mimecast-MFC-AGG-ID: INJRJMUZODKLyKi5g4G--w_1742984589
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB1FE180AF4C
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 10:23:08 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 838D11956095;
	Wed, 26 Mar 2025 10:23:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 1e26c5e2)
Date: Wed, 26 Mar 2025 10:23:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <80150.125032606230900383@us-mta-138.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EMmq70h7Tx6Y1cID9ZIbLgHiQVulDvOcZA3hhziPDp8_1742984589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'media/v6.15-1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mchehab/linux-media

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1735466143

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1735466143-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1735466143-x86_64-kernel
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

