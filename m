Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5C25EFB9
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834533; cv=none; b=SQMvg8Spwap7jEuKIKbuT79xnjFOrcwdrJXN8EntloWfQ3HGoRjIReNwbFxdOLM1TPCyucKN6B9PmZmnk7Gtf3zNZFZfcH4aDJirbszlUDPLYka17WH0f9HQpLDEOMCYkXqOjslu62km1/ihP7/Alfwy1ECkmtHKRqe77FMZIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834533; c=relaxed/simple;
	bh=vTIm5ApeUEU5hjQYeXiyZURaG/79ZTQUTHhYixfwp9A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jazk9sA06xGo482lGmc2IdyWGN/tIOx5tSJZTetoea38WJHabpLnfDy+9YVPUXAJGiTYmcceIDGSKkdbcEvkiK/qIPIVZl2I97ils/itQf3d5Y+Gtsc0Vf2fNcz2boPKbjs+Vgpk65hxdQvKa5wPZkLtaDSBKJpYU70etjhZRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAMwFKHz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAMwFKHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742834528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zVv0EiiFpRxTfFVWLEfzajNf/yRnplckPYPY1erDsNw=;
	b=RAMwFKHzLI7Zuldvtwmdsye31oIihfepSwJ6UtRxet4SRs9R93WentYS6DeY7RmRvXLwFC
	NecDFNH8A6tMwKh8uzkgCt5gBA+ul7oV059iWzzjvAHXICTor7HBxbIAjnSEtCjl6BN+Ix
	E3sKQcsMR39mQKc8BUo17YXCAWU2auY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517--CwDPFJIOdmrlnASN1aAmg-1; Mon,
 24 Mar 2025 12:42:05 -0400
X-MC-Unique: -CwDPFJIOdmrlnASN1aAmg-1
X-Mimecast-MFC-AGG-ID: -CwDPFJIOdmrlnASN1aAmg_1742834524
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8770B196B37B
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 16:42:04 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D29D61955BC1;
	Mon, 24 Mar 2025 16:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 38fec10e)
Date: Mon, 24 Mar 2025 16:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <75231.125032412420502962@us-mta-517.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jqimhXpJWkf9CyFPj7Vy1z9ediPALRn7vcg79g5axT4_1742834524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.14

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1732140823

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1732140823-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1732140823-x86_64-kernel
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

