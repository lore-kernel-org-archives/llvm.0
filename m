Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB37231C88
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728074588; cv=none; b=g39m3uh15wB0SJhZVOvg3Ff2mRvsnSUfiU0cPEFC8RYcJ61A8AeLKd4Z3MGb4uoQJjMVJ839biO4zkzx2hqj78PF1emfS1HmM5sSy9Sw5w49r3QHNjaIkWS6KrWhVPEbw7FlgFszJbWdwDQ4jZgCstSEL2DyR6TyGrA7EYBL7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728074588; c=relaxed/simple;
	bh=/7llMyybrWGscbdVXEfl/lDdinOzTC0wts8MRj/wT2c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tO3MGKF9mlUiC48uzrYP+Xv+OTQto5nSAAV3hjAkRRc+kRG7Xz2OKfm2CaD1AjJ9ro1OrWqF9drTRs+Ry0MrdxWkgNyLDsM1pd/H8Muca6Xua/Ekq/NUJ0kGzObeeJ94+NgNh/tLQ8dtapr8XLnMT+IxSiu4jpUfELtzlNrpTlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GyHLJJUI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GyHLJJUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728074585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/nTk9Nof49tAPTByfq/pJ1KaZU8LwBLkO2RX6lQRFh8=;
	b=GyHLJJUIqhyzoepOwu+1fMc1x7zWShokdhxcyWJ+SVEp+78BTz6eGXmfojF+g8VNttw3xr
	3WvSm5FC43roEXVrHNbL7islpNKFFRcygNE359Z2xGQgNDgxoWD0FZ9Gow2hjOMIE0wfng
	WrJ/FtbRlqueK67isxd0QJYygfc1fwg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-g7U0NhrTMJq-HA915xOJgg-1; Fri,
 04 Oct 2024 16:43:04 -0400
X-MC-Unique: g7U0NhrTMJq-HA915xOJgg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95A7B1955EA7
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 20:43:03 +0000 (UTC)
Received: from [172.64.3.39] (unknown [10.30.33.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 407F51956088;
	Fri,  4 Oct 2024 20:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc1,
 mainline.kernel.org-clang, ac308609)
Date: Fri, 04 Oct 2024 20:43:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <55694.124100416430401252@us-mta-607.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1482355036

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1482355036-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1482355036-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1482355036-x86_64-kernel-debug


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

