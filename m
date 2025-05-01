Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28503611E
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746072130; cv=none; b=uo5fWQitFs0ExkYpqA8UwGn4qGLvUsgYAqzb2TswOpPuLtzvGmPbegpbThnMJ8txtQW2j3Smq0mz6m4Irh+9r8AsjyNZA0fpEhvGGWK3haXyMPvy6zYSQYIpqvn74yTKlIq5rq0TlSxTJ0/W9ho8H5dB1sB//WJz3WytgrG8o3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746072130; c=relaxed/simple;
	bh=/1gloc7dZMHilCxWqPsS/ObL287NCQTEkbfy/jfRiBI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YkVZLTO+pbg5HgVMHdtHam9lmeXVWVA9EFmHsj2k5EEUgb70BRzyxMr7EdtFec7nJOHcigGf0Dhj2yAHLNY8XFwS27iYGj2Nx2Te/HgP5juhWaUIq4y0ca8VDvxUr36rP9rR6exxc1jzxtcXcpPoJdfnyht0Zmx3/cQ+KG+CN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPfis82K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPfis82K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746072128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0st0WzAp0ZjQYXHi/MGmojSC79rgeTAwgtr+MNb3RjQ=;
	b=HPfis82KNe9//mZtOFvQwsO2CT39jRA6YmK8FUOGzbHRXosIQ2P+xu/5UmRnCMp6VIQWOv
	8pdb/kDyqAvAS87Gk3gR3kQCDaf0eSRywCi9HkeOUbKzF/Cs3BHi5Eten9fwhvRQwtskq4
	p4igkUgO0luH4nm8YXliT21OIduNLh4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-zXj-r4LmOGWa6VRBf6LUvA-1; Thu,
 01 May 2025 00:02:06 -0400
X-MC-Unique: zXj-r4LmOGWa6VRBf6LUvA-1
X-Mimecast-MFC-AGG-ID: zXj-r4LmOGWa6VRBf6LUvA_1746072126
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01051180098F
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 04:02:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9483D1800359;
	Thu,  1 May 2025 04:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, 4f79eaa2)
Date: Thu, 01 May 2025 04:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <82994.125050100020600527@us-mta-317.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3PbrrptDe49gORmJL0BmgwF5XnH832pmm2RL-0EDIwE_1746072126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: kbuild: Properly disable -Wunterminated-string-initiali=
zation for clang

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1795426337

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1795426337-x86_64-kernel-debug


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

