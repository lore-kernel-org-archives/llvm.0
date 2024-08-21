Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2972B9B5
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724211130; cv=none; b=TedjJ/LMuUmDOpdqkNZ61S5CQ85HBJZmjm2pOyblSoAPRQBzuxHl6onF6Rb2H6FQ5Pppqdpm5P2folmPRp5BDh2rsSwbdhgvAws11o46wbmC1N77NzUJI6a7z4M87SnRpm5ExIZz5O01oeBEmsEEx6S/cc4Gcv6jZ6+boqrDgGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724211130; c=relaxed/simple;
	bh=fk597ScwhD3LUVH0pUkljlPH9vosFDD41CmQYVS3OCE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=X0FUoP6hLoR8bgnlvdbpaeEgEbtYZiApx5hV+sldDCxXf0rwUkfiianFXOkR/KUBPuULTB9LjvLqHFJsJlPSm5ECO5zoJ7OjjeVw3yjvTfpuq0EHLYUKfHnIy6EH6Acz/jc/VfSNoYRhEzaXrvlxUWRQqyMlph7nS4yeScoaNsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkOu/jta; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkOu/jta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724211127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eQLry9HiGVjN1oNTsyP5fBbwqmgn5XQ+RQCdkc1UPOs=;
	b=MkOu/jtagchtMKLAiYi1LieeJtpmsdIlCg5o8Hi/T1RCukFU77JmlEqlbjtW4NTyOJJsPy
	yn6r82GlKBWuXZZx932bYqj3sjdMPWENb0KCUNgztqqSI0SEobJA+BhsBLAWksmCUO4h08
	3l3oLk623kEqLZD6fhZD0C8ukVXtlnw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-AURUKi-_NlajENkJAbY-Mg-1; Tue,
 20 Aug 2024 23:32:04 -0400
X-MC-Unique: AURUKi-_NlajENkJAbY-Mg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AEC41955BF9
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 03:32:04 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 878DB1955F3F;
	Wed, 21 Aug 2024 03:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, b311c1b4)
Date: Wed, 21 Aug 2024 03:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <76016.124082023320500120@us-mta-640.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.11-rc4-server-fixes' of git://git.samba.or=
g/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1420765995

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1420765995-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1420765995-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1420765995-x86_64-kernel-debug


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

