Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04F6F079
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722206593; cv=none; b=LemCxdDF8mtow8sIzu4eNx0/s6Rve4tBbMqH3MV4xNLLbKtoeZuMkfHETP1zbUNkqrge5drSxBL8H1rere7PjXsGgg6+uTJ0Oo4I5kDS/fnIPo8MYJFvFmso5k0we9g77h5HnFy3efp4bWE6Cmz96zGuPqHK2Av1JlqYfElxEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722206593; c=relaxed/simple;
	bh=svwQWtU8ekUW6wsmoHx0p0PjLJgKwbW2j+sEH5XLhP4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Q0WaAG99yKew9zQaHQyPTMsPlV+YfawDhF/y8JK/UhE/a4NOzv1CCPjO8luResbiYUG4fAUWSVjH/YIGiFTCdsVUIzyy1ghwLheZpbHLhpqVskT4P162jt6pX4EPjB3DN1oUgRL8HoBk16PZNiZq1OvugWVEM/+4gyIoGv0gIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdHZyAgc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdHZyAgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722206590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wY+80RDYDBrlwWholHD7Z2AkKw1kD0GvLE4TgLL6Uc0=;
	b=ZdHZyAgcMjJll25kDL+umAica5ET4mo77eyeQLgd9fMUq5KTbIemGB6HeEeltPybYNDA33
	O6luAnsF7yziro95eA//LVvsvzppfU+dn8mpDFr2s4jXxyXZRY6rB3c8tcaEin0V11xH/i
	Z39Ly5Ok/AqgI+bowPdkT+qWXxnJHvc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-475-7vzH3jT4Paen9WcuSHG98g-1; Sun,
 28 Jul 2024 18:43:07 -0400
X-MC-Unique: 7vzH3jT4Paen9WcuSHG98g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC88419560AD
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 22:43:06 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5625619560AE;
	Sun, 28 Jul 2024 22:43:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 017fa3e8)
Date: Sun, 28 Jul 2024 22:43:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <28511.124072818430700177@us-mta-475.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: minmax: simplify and clarify min_t()/max_t() implementa=
tion

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1391226697

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391226697-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391226697-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1391226697-x86_64-kernel-debug


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

