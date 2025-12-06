Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49070808
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765049590; cv=none; b=bKC0AulcHJ1JgLIhbsSDY6P2pOj7xlSLCJdVbaVejhGyMMIgXSObKNbHb/PBVW7TnLUTyt5AUvI52IUL5kBZT2fst10QGnbBrnWvuNtzksJUY7asZd2CH91Y8DMQ9oAys4WJR9Wxr6stx1HoFgqdXKceo0uDq25+arWbJ5fhbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765049590; c=relaxed/simple;
	bh=Pj4w9UX/5vftYsIvB+o6C7JwL8amilQ+NUDd9YlwFzA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QlD7VgwSTmv12krkcLQmOk79gqE2C/1ksEbM4AxeIuZixUAIRt7JXzAYutR/dd+HDumDT4Ot3Ri7OfPTmqclAWZRqJDxCsiIGruz2lj8fMfR3AYNT6rFJzFP4a9vkfnNGy44qNXZHdDI1LP0UfXubUlrobr273ZnocExjg0KDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HREPfvre; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HREPfvre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765049586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=91ua5Y5EyiOC7LNUEMgw4cFc6KoMUrL7dWxnZk9+cUI=;
	b=HREPfvre4BER0VNYVHoU9PcjPY/mnosKCbZlNXS7zDmbKp2j+iD1US6eAqL3YwSacQdKQt
	Bh1HrjJmgaMIyDGz0mi7AJYKb9MIKj6gedLFs+w1OwoH3QO2Z34V3tRfbCZ26PvmlRiMWq
	vJ3MLh2hfLOVMxhjZIxRu6E+c2iCo/E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-4vAWEvTfOKWjDDSDtvM0bA-1; Sat,
 06 Dec 2025 14:33:05 -0500
X-MC-Unique: 4vAWEvTfOKWjDDSDtvM0bA-1
X-Mimecast-MFC-AGG-ID: 4vAWEvTfOKWjDDSDtvM0bA_1765049584
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB5CA1800358
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 19:33:03 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 953AC180045B;
	Sat,  6 Dec 2025 19:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, f468cf53)
Date: Sat, 06 Dec 2025 19:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <34050.125120614330500147@us-mta-38.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DdL9TrVohY1S9yKtxCzHu7vX9toVhV7to5aRyavNfM_1765049584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bitmap-for-6.19' of github.com:/norov/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2199970920

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2199970920_x86_64_kernel-debug


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

