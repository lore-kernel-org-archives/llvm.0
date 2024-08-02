Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317B1AE04D
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622392; cv=none; b=E27S1QYnOlMCXSTUCkLd6oTCx0yG+RPLQZKrfAYilmhjr4glXYA40mKC8F3s9Fqnvaj42GgFk7y+Mmj6K7cgz7krp69CUSHyMDzNDw8Sl1OR9SqTN4VCcZEAfS/VD6+Boztj4cHSEzmNVD5JBg8t2cQZpqVD00GAXFVcxJaECWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622392; c=relaxed/simple;
	bh=nA6OU3iv/io2e/ZqGklHJjlXu7X/h7GQfTXzmtlzOmk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QusqEitahPyiw7lQnRAInyyBG6PS6/wm1h/EYTZSpfMsgWfY+vguiDhyn6hhEZTb/3/InK7pggg0vhTy0y/mnV9hblUembBDt1FXV9dfBfBnnQlNnrYThGShqJRzo4P6JDLqQXPSoCxgvO1wSlnoI2pRjExa5CD+CuR5gb0JY7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V26D5wfH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V26D5wfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722622389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H/S6yBtc+BxNl8or3VIaWYFlNW1QZ/I+I1RtP00zZ+8=;
	b=V26D5wfHjRnw52NH4bJj4u01PUkYaWfjookEMSY4LYzo+vC/IFLD8ZNbXd+4G5HgjPiL/x
	2/ppTa+BELmtWXxqa7fPnWS1KM4VwWQzDLnAMdFIambd5Ho1gBD7P3BOjbE7kWks8pKlg0
	Yftc9gfHXuJqf9DUOTJk4AN/Szf8gMs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-JL9ausYpN7qJrrOWEZbNgA-1; Fri,
 02 Aug 2024 14:13:04 -0400
X-MC-Unique: JL9ausYpN7qJrrOWEZbNgA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ED0A1955D48
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 18:13:04 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 674321955D4A;
	Fri,  2 Aug 2024 18:13:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, 948752d2)
Date: Fri, 02 Aug 2024 18:13:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <38216.124080214130402775@us-mta-623.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'riscv-for-linus-6.11-rc2' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/riscv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1398865629

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1398865629-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1398865629-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1398865629-x86_64-kernel-debug


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

