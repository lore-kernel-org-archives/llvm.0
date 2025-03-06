Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415A27602E
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297998; cv=none; b=WcoNGInGcMCoW6xjBSSPwT39WAip4+IeWbyFOiq5/YYO/1KQRphAF8dNPRQGlZL6TuDqHOPADh9n8OnR1LIkQfmtn8UisytVR7oi/YuweQu1uOtyLW3CoDdv113dthzM2iFfM6zbTMvbsFwHaLHUtDkM2dNgVgY7to6vuxmiGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297998; c=relaxed/simple;
	bh=0lGPI/71v+B7C8QBhCh32plurKzEtWVQS2YQ3mr2icE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rgg2yRtNhfa8KlAQix67VOT70KlOELUDxCwfzxSmpW8UkpNPbVYCeLXA5ysY/4SZscD7ygbPfhU2Hsc99ZB5Gdz7dEz7xy7MU7stAjO2IiUUDsohJwHg+j0cWqxAJ+fa2ug7wA31BzF7meC14jCzbUqXbTUQGz0ZtW4lwxWH0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NDXfeicK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NDXfeicK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741297995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I2AUMFBbPxd0yDA45OFAE+5niUOQsi6jJ/UtLkKXi2A=;
	b=NDXfeicKHiFUxgDbO8Z8enpkOzQlAueuBqVyApDHV0+K8XWZZGVgRUp8sSctG6P9rkTTRO
	B8h8BIzQpgz8hn2CW4JZiS+MPKhKlcS7ECwyOXr+T+6uVidD1jlrlgZ7HaZGNDQuACj6BM
	zbQJ5ij/JQhFBaSuh6arBa+XtC0LYT8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-aHGd4yCXMHKqNzAJ39-22g-1; Thu,
 06 Mar 2025 16:53:12 -0500
X-MC-Unique: aHGd4yCXMHKqNzAJ39-22g-1
X-Mimecast-MFC-AGG-ID: aHGd4yCXMHKqNzAJ39-22g_1741297992
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0E6019560B5
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 21:53:11 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B81D195608F;
	Thu,  6 Mar 2025 21:53:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 1238f0af)
Date: Thu, 06 Mar 2025 21:53:11 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <14005.125030616531200689@us-mta-341.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EdkPt5kLkGDkpUhLRtg87BGgFhopW4ywZoFqc67KokQ_1741297992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc5-smb3-fixes' of git://git.samba.org=
/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703758957

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703758957-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703758957-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703758957-x86_64-kernel
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

