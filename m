Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80DB14C5BD
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360632; cv=none; b=oAF9T0BnvCVs3Lbz8puvQhLyXVn0DgV18m1GtuX+f3iDJlzMhVszFPx1kS9CiFsjT5KldEwSW4MjRPiI1nteMyy2l0AAr4AN/sz6ht/Q9qTa6I+IagKjvsxJ9UaWvWZcfuWsZBI7dyvn1CCXe5dC+UFvtEWncQYACm5TbjO0rgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360632; c=relaxed/simple;
	bh=UHZVLLKgvYk+K66Vn02BfmmvdivsQ2aFjGnvGYssf5Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=IYd+Yqsd8d8HOh57rz28as77lC4TgKrrN5sOHf8wCTAZSaix83VCmEwfmn5HYWnmpAZGAPMUqDnZmPY1iINNWz9BP27GAG7eTo+x5ihiMYhIbA4WYwQlzemfE+YQyFMbKQcD/4mm9vinWV+3pZCP4QbJeB2+W/rOlnqja2ybDfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXnkU4Ee; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXnkU4Ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oOSiFwGE7vI5Pc3UjKFHvXfB4BMuY72ShV43KLRvQ94=;
	b=SXnkU4EeIZuky44oqDF4ULQd2X2k+vyboubrmGhglzD7iON4ulYXyCEum7aQ09isfmNwKH
	kD0cnKenRQnG9jeCeKLe4toSL+Nf9hsus34++6/Xz1skTh3UUESs5dkSwUzf/YyO9h8Z9x
	Hrwg3wfWPdQaZ6x7gD0I8Y+RAeOKXJQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-44sFr3IJNeaz6e5NFRjnrg-1; Thu,
 26 Sep 2024 10:23:48 -0400
X-MC-Unique: 44sFr3IJNeaz6e5NFRjnrg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 300631955D97
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:23:47 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE96E3003E40;
	Thu, 26 Sep 2024 14:23:46 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, bc83b4d1)
Date: Thu, 26 Sep 2024 14:23:46 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <06943.124092610234800831@us-mta-528.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bcachefs-2024-09-09' of git://evilpiepirate.=
org/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1446277485

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1446277485-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1446277485-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1446277485-x86_64-kernel-debug


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

