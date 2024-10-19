Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480B320E
	for <llvm@lists.linux.dev>; Sat, 19 Oct 2024 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729365188; cv=none; b=C98hIuTbfUs0EJktimWGr2Fe+WDBVC+qQrdG8JtMHNYw2LuDMeAiSOeuuDhm65/o25ZMQ6FLtv456cRxcleXOqkQW09vQc00RzwNhgl5xnrA0PKdvQqoHC1QNEk7JZaIuyIcM4FtQtPhiCvU+6Przl18HZzjCipCB8nkW+x0HGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729365188; c=relaxed/simple;
	bh=v4T0OyQBz/8t63t/g18g2wieqHFoJ6VMdygkl1PSObY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VttShc+/LVhlkR238whG+tAX2J2NVhFEcLKA1xJIKtW1XMk4+ObWkQDrDvx77djL7AzNPv/j1SNHyKS647PQVp05AyEgx8hNR5WqR40SYJn/ZWBX9dpgi1RXXTJoezcFZzm2Rfc9OsgNf3rwFRj6wqrbztyIXaxs31ctbl4cEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GiTb6Bkq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GiTb6Bkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729365185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fLlEKpSJsMbndNEjPgEZXIbn9lUoZ/W/TWFBglotrGo=;
	b=GiTb6Bkqo6o2NU/htZzh0Fcn27W5XrorfL63Vk2ZCyuZuuiEI8VCgunZjxP7lKh5f8W+1r
	kZdgN6vzOEAAClY0eBSxCUDDU9z4/IyY/P3GkmTeXK0wSES2ONhZ9KU8R/dPRsSlwE9AWa
	eNIQq5JILDOMS7I4zLowG8jeoqyaHtk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-uuEudx6gMUy6ZH5YbAgkPg-1; Sat,
 19 Oct 2024 15:13:04 -0400
X-MC-Unique: uuEudx6gMUy6ZH5YbAgkPg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 257E019560A3
	for <llvm@lists.linux.dev>; Sat, 19 Oct 2024 19:13:03 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C58E9300018D;
	Sat, 19 Oct 2024 19:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, f9e48255)
Date: Sat, 19 Oct 2024 19:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <79420.124101915130400441@us-mta-567.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'input-for-v6.12-rc3' of git://git.kernel.org=
/pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1503527936

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1503527936-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1503527936-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1503527936-x86_64-kernel-debug


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

